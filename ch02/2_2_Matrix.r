# 내용:ch02 데이터 유형과 구조 - Matrix 자료구조 p63

#Matrix(행렬) 생성
m1 <- matrix(c(1:12))
m1

m2 <- matrix(1:12, nrow = 3, ncol = 4)
m2

m3 <- matrix(1:12, nrow = 3)
m3
m3[1,1]
m3[1,3]
m3[3,3]

m4 <- matrix(1:12, 3, byrow = T) #행우선
m4

m5 <- matrix(1:12, 4, byrow = F) #열우선
m5

#벡터결합을 이용한 행렬생성
x <- c(1, 2)
y <- c(3, 4)

M1 <- rbind(x, y)
M2 <- cbind(x, y)
M1
M2
M1[1,]
M1[,2]

M3 <- rbind(1:3, 4:6)
M4 <- cbind(1:3, 4:6)
M3
M4

#행렬연산
M1 + M2
M1 - M2
M1 * M2
M1 %*% M2

#교재 p64 실습 - 벡터를 이용한 행렬 객체 생성
m<-matrix(1:5)
m
#교재 p64 실습 - 벡터의 열 우선으로 행렬 객체 생성하기
m<-matrix(c(1:10),nrow=2)
m
#교재 p64 실습 - 행과 열의 수가 일치하지 않는 경우
m<-natrux(c(1:11),nrow=2)
m

#교재 p65 실습 - 벡터의 행 우선으로 행렬 객체 생성하기
m<-matrix(c(1:10),nrow=2,byrow=T)
m
#교재 p65 실습 - 행 묶음으로 행렬 객체 생성하기
x1<-c(5,40,50:52)
x2<-c(30,5,6:8)
mr<-rbind(x1,x2)
mr
#교재 p65 실습 - 열 묶음으로 행렬 객체 생성하기
mc<-cbind(x1,x2)
mc
#교재 p66 실습 - 2행으로 행렬 객체 생성하기
m3<-matrix(10:19,2)
m4<-matrix(10:20,2)
m3
mode(m3);class(m3);
#교재 p66 실습 - 첨자를 사용하여 행렬 객체에 접근하기
m3[1,]
m3[,5]
m3[2,3]
m3[1,c(2:5)]
#교재 p67 실습 - 3행 3열의 행렬 객체 생성하기
x<-matrix(c(1:9),nrow=3,ncol = 3)
x
#교재 p67 실습 - 자료의 갯수 보기
length(x)
ncol(x)
#교재 p67 실습 - apply()함수 적용하기
apply(x,1,max)
apply(x,1,min)
apply(x,2,mean)

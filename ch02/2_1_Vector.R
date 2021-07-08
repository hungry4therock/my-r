#내용: ch02.데이터 유형과 구조 - vector 자료구조 교재 p 58

#Vector - R에서 가장 많이 사용하는 자료구조, 배열과 동일
v1 <- c(1,2,3,4,5)
v1
v1[1]
v1[5]

v2 <- 1:5
v2
v2[1]
v2[5]

#벡터연산
x <- 1:4
y <- 5:8

x+y
x-y
x*y

#seq() 함수로 벡터생성
v3 <- seq(1, 10, by=2)
v3

#벡터의 합과 평균
sum_v1 <- sum(v1)
sum_v1

sum_v2 <- sum(v2)
sum_v2

mean_v1 <- mean(v1)
mean_v1

mean_v2 <- mean(v2)
mean_v2


#교재 p58 실습 - c() 함수를 이용한 벡터 객체 생성
c(1:20)
#교재 p58 실습 - seq() 함수를 이용한 벡터 객체 생성
1:20
#교재 p59 실습 - rep() 함수를 이용한 벡터 생성 
rep(1:3,3)
#교재 p59 실습 - union(), setdiff(), intersect() 함수를 이용한 벡터 자료 처리
rep(1:3,each=3)
#교재 p59 실습 - 숫자형, 문자형, 논리형 벡터 생성
x<-c(1,3,5,7)
y<-c(3,5)
union(x,y)
setdiff(x,y)
intersect(x,y)

v1<-c(33,-5,20:23,-2:3)
v2<-c("홍길동","이순신","유관순")
v3<-c(T,TRUE,FALSE,T,TRUE,F,T)
v1;v2;v3
v4<-c(33,05,20:23,12,"4")
v4
#교재 p60 실습 - 자료형이 혼합된 경우
v1;mode(v1);class(v1)
v2;mode(v2);class(v2)
v3;mode(v3);class(v3)
#교재 p60 실습 - 벡터 객체의 값에 칼럼명 지정
age<-c(30,35,40)
age
names(age)<-c("홍길동","이순신","강감찬")
age
age<-NULL
#교재 p61 실습 - 벡터 자료 참조하기
a<-c(1:50)
a[10:45]
a[19:(length(a)-5)]
#교재 p61 실습 - c() 함수에서 콤마 사용 예
v1<-c(13,-5,20:23,12,2:3)
v1[1]
v1[c(2,4)]
v1[c(3:5)]
v1[c(4,5:8,7)]
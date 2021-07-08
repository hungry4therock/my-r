#내용: 데이터 프레임 자료 구조 p 71

#데이터프레임 생성
a <- c(1, 2)
b <- c(3, 4)
c <- c(T, F)

df1 <- data.frame(a, b, c)
df1

df2 <- data.frame(num  = c(1, 2, 3),
                  name = c('김유신', '김춘추', '장보고'),
                  age  = c(31, 29, 42))
df2

#member_df 데이터프레임 생성
uid  <- c('a101', 'a102', 'a103', 'a104', 'a105')
name <- c('김유신', '김춘추', '장보고', '강감찬', '이순신')
hp   <- c('010-1234-0001', 
          '010-1234-0002', 
          '010-1234-0003', 
          '010-1234-0004', 
          '010-1234-0005')
pos  <- c('대리', '과장', '사원', '부장', '과장')
dep  <- c(101, 102, 103, 104, 105)

member_df <- data.frame(uid, name, hp, pos, dep)
member_df

#데이터프레임 데이터 출력
df2$name[1]
df2$name[3]

member_df$uid[1]
member_df$uid[3]
member_df$name[2]

#데이터프레임 필수 내장함수
iris
class(iris) #데이터 유형 확인
View(iris)  #데이터프레임을 표 형태로 출력
head(iris)  #데이터프레임 상위 6개 출력
tail(iris)  #데이터프레임 하위 6개 출력
str(iris)   #데이터프레임 컬럼 자료유형 확인
dim(iris)   #데이터프레임 행열 구조 확인
names(iris) #데이터프레임 속성(컬럼명) 확인
summary(iris) #데이터프레임 요약통계 확인인

aggregate(iris[,-5], by=list(iris$Species), mean)
aggregate(iris[,-5], by=list(iris$Species), max)


#교재 p72 실습 - 벡터를 이용한 데이터프레임 객체 생성하기
no<-c(1,2,3)
name<-c("hong","lee","kim")
pay<-c(150,250,300)
vemp<-data.frame(No=no,Name=name,Pay=pay)
vemp
#교재 p72 실습 - matrix를 이용한 데이터프레임 객체 생성하기
m<-matrix(
  c(1,"hong",150,
    2,"lee",250,
    3,"kim",300),3,by=T)
memp<-data.frame(m)
memp
#교재 p72 실습 - 텍스트 파일을 이용한 데이터프레임 객체 생성하기
getwd()
txtemp<-read.table('emp.txt',header=1,sep="")
txtemp
#교재 p73 실습 - CSV 파일을 이용한 데이터프레임 객체 생성하기
csvtemp<-read.csv('emp.csv',header=T)
csvtemp
help(read.csv)
name<-("사번","이름","급여")
read.csv('emp2.csv',header=F,col.names = name)
#교재 p73 실습 - 데이터프레임 만들기
df<-data.frame(x=c(1:5),y=c(2,10,2),z=c('a','b','c','d','e'))
df
#교재 p73 실습 - 데이터프레임의 칼럼명 참조하기
df$x
#교재 p74 실습 - 데이터프레임의 자료구조, 열수, 행수, 칼럼명 보기
str(df)
ncol(df)
nrow(df)
names(df)
df[c(2:3),1]
#교재 p74 실습 - 요약통계량 보기
summary(df)

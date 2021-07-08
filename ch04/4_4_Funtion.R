#날짜 : 2021/06/29
#이름 : 김철학
#내용 : Ch04.제어문과 함수 - 함수 교재 p118

##################
#교재예제 실습하기
##################

#교재 p118 실습 - 매개변수가 없는 사용자 함수 정의하기
f1<-function(){
  cat("매개변수가 없는 함수")
}
f1()
#교재 p118 실습 - 결과를 반환하는 사용자 함수 정의하기
f3<-function(x,y){
  add<-x+y
  return(add)
}
add<-f3(10,20)
add
#교재 p119 실습 - 기본함수를 사용하여 요약통계량과 빈도수 구하기
setwd("C:/Rwork/Part-I")
test<-read.csv("test.csv",header=TRUE)
head(test)

summary(test)
table(test$A)

data_pro<-function(x){
  for(idx in 1:length(x)){
    cat(idx,"번째 빈도분석 결과")
    print(table(x[idx]))
    cat("\n")
  }
  for(idx in 1:length(x)){
    f<-table(x[idx])
    cat(idx,"번쨰 칼럼 최대값/최소값\n")
    cat("max=",max(f),"min=",min(f),"\n")
  }
}
#교재 p120 실습 - 분산과 표준편차를 구하는 사용자 함수정의
x<-c(7,5,12,9,15,6)

var_sd<-function(x){
  var<-sum(x-mean(x)/2)/(length(x)-1)
  sd<-sqrt(var)
  cat("표본분산:",var,"\n")
  cat("표본표준편차:",sd)
}
var_sd(x)
#교재 p121 실습 - 피타고라스식 정의 함수 만들기
pytha<-function(s,t){
  a<-s^2-t^2
  b<-2*s*t
  c<-s^2+t^2
}
pytha(2,1)
#교재 p121 실습 - 구구단 출력함수 만들기
gugu<-function(i,j){
  for(x in i){
    cat("**",x,"단**\n")
    for(y in j){
      cat(x,"*","=",x*y,"\n")
    }
    cat("\n")
  }
}

i<-c(2:9)
j<-c(1:9)
gugu(i,j)
#교재 p122 실습 - 결측치를 포함하는 자료를 대상으로 평균구하기
data<-c(10,20,5,4,40,7,NA,6,3,NA,2,NA)
na<-function(x){
  print(x)
  print(mean(x,na.rm=T))
  
  data=ifelse(!is.na(x),x,0)
  print(data)
  print(mean(data))
  
  data2=ifelse(!is.na(x),x,round(mean(x,na.rm=TRUE),2))
  print(data2)
  print(mean(data2))
}
na(data)
#교재 p126 실습 - 기술통계량 관련 내장함수 사용하기
seq(-2,2,by=.2)
vec<-1:10
min(vec)
max(vec)
range(vec)
mean(vec)
median(vec)
sum(vec)
sd(rnorm(10))
table(vec)
#교재 p126 실습 - 정규분포(연속형)의 난수 생성하기
n<-1000
rnorm(n,mean = 0,sd=1)
hist(rnorm(n,mean=0,sd=1))
#교재 p127 실습 - 균등분포(연속형)의 난수 생성하기
n<-1000
runif(n,min = 0,max = 10)
hist(runif(n,min = 0,max = 10))
#교재 p128 실습 - 이항분포(이산형)의 난수 생성하기
n<-20

rnbinom(n,1,prob = 1/2)
rnbinom(n,2,0.5)
rnbinom(n,10,0.5)
n<-1000
rbinom(n,5,prob = 1/6)
#교재 p128 실습 - 종자값으로 동일한 난수 생성하기
rnorm(5,mean = 0,sd=1)
set.seed(123)
rnorm(5,mean = 0,sd=1)
set.seed(123)
rnorm(5,mean = 0,sd=1)
set.seed(345)
rnorm(5,mean = 0,sd=1)
#교재 p130 실습 - 수학 관련 내장함수 사용하기
vec<-1:10
prod(vec)
factorial(5)
abs(-5)
sqrt(16)
vec
cumsum(vec)
log(10)
log10(10)
#교재 p131 실습 - 행렬연산 내장함수 사용하기
x<-matrix(1:9,nrow = 3,ncol = 3,byrow = T)
y<-matrix(1:3,nrow = 3)
ncol(x)
nrow(x)
t(x)
cbind(x,1:3)
rbind(x,10:12)
diag(x)
det(x)
apply(x,1,sum)
apply(x,2,mean)
svd(x)
x %*% y
#교재 p132 실습 - 집합연산 관련 내장함수 사용하기
x<-c(1,35,7,9)
y<-c(3,7)

union(x,y)
setequal(x,y)
intersect(x,y)
setdiff(x,y)
setdiff(x,y)
setdiff(y,x)
5 %in% y
#날짜 : 2021/06/29
#이름 : 김철학
#내용 : Ch04.제어문과 함수 - 조건문 교재 p110

##################
#교재예제 실습하기
##################

#교재 p110 실습 - if() 사용하기
x<-50;y<-4; z<-x*y
if(x*y>=40{
  cat("x*y의 결과는 40이상입니다.\n")
  cat("x*y=",z)
}else{
  cat("x*y의 결과는 40미만입니다.x*y=",z,"\n")
}
#교재 p110 실습 - if() 사용으로 입력된 점수의 학점 구하기
score<- scan()
score
result<-"노력"
if(score>=80){
  result<-"우수"
}
cat("당신 학점은",result,score)

#교재 p111 실습 - if ~ else if 형식으로 학점 구하기
socore<-scan()
if(score>=90){
  result="a"
}else if(score>=80){
  result="b"
}else if(score>=70){
  result="c"
}else if(score>=60){
  result="d"
}else{
  "f"
}
cat("당신 학점은",result)
print(result)

#교재 p112 실습 - ifelse() 사용하기
score<-scan()
ifelse(score>="우수","노력")
ifelse(score<="우수","노력")
#교재 p112 실습 - ifelse() 응용하기
excel<-read.csv("c:Rwork/Part-I/excel.csv",header=T)
q1<- excel$q1
q1
ifelse(q1>=3,sqrt(q1),q1)
#교재 p113 실습 - ifelse() 에서 논리연산자 사용하기
ifelse(q1>=2&q1<=4,q1^2,q1)
#교재 p113 실습 - switch() 를 사용하여 사원명으로 급여정보 보기
empname<-scan(what="")
empname
switch(empname,
       hong=250,
       lee=350,
       kim=200,
       kang=400
)

#교재 p114 실습 - 벡터에서 which() 사용:index 값을 반환
name<-c("kim","lee","choi","park")
which(name=="choi")
#교재 p114 실습 - 데이터프레임에서 which() 사용
name<-c("kim","lee","choi","park")
which(name == "choi")
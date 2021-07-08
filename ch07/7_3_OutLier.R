#날짜 : 2021/06/30
#이름 : 김철학
#내용 : Ch07.EDA와 Data 정제 - 이상치(극단치) 실습하기 교재 p202

setwd("C:/Users/bigdate/Desktop/workspace/R")


library('dplyr')

#이상치를 갖는 dataframe 불러오기
df_exam <- read.csv('./file/exam_outlier.csv')
View(df_exam)

#이상치를 결측치로 수정
df_exam$math    <- ifelse(df_exam$math    > 100 | df_exam$math    < 0, NA, df_exam$math)
df_exam$english <- ifelse(df_exam$english > 100 | df_exam$english < 0, NA, df_exam$english)
df_exam$science <- ifelse(df_exam$science > 100 | df_exam$science < 0, NA, df_exam$science)

View(df_exam)

#결측치 0으로 수정
df_exam[is.na(df_exam)] <- 0
View(df_exam)

#기본통계분석
df_exam %>% mutate(total=math+english+science, mean=total/3) %>% arrange(desc(total))

#교재 p203 실습 - 범주형 변수의 극단치 처리하기
table(dataset$gender)
pie(table(dataset$gender))
#교재 p203 실습 - subset() 함수를 사용하여 데이터 정제하기
dataset<-subset(dataset,gender==1|gender==2)
dataset
length(dataset$gender)
pie(table(dataset$gender))
pie(table(dataset$gender),col=c("red","blue"))
#교재 p204 실습 - 연속형 변수의 극단치 보기
dataset<-read.csv("dataset.csv",header=T)
dataset$price
length(dataset$price)
plot(dataset$price)
summary(dataset$price)
#교재 p205 실습 - price 변수의 데이터 정제와 시각화
dataset2<-subset(dataset,price>=2&price<=8)
length(dataset2$price)
stem(dataset2$price)
#교재 p205 실습 - age 변수의 데이터 정제와 시각화
summary(dataset@age)
length(dataset2$age)

dataset2<-subset(dataset2,age >= 20 & age<=69)
length(dataset2)

boxplot(dataset2$age)
#교재 p206 실습 - boxplot와 통계를 이용한 극단치 처리하기
boxplot(data$price)

boxplot(dataset$price)$stats

dataset_sub<-subset(data.set,price >=2.1 & price <= 7.9)
summary(dataset_sub$price)
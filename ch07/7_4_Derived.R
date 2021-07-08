#날짜 : 2021/06/30
#이름 : 김철학
#내용 : Ch07.EDA와 Data 정제 - 파생변수 실습하기 교재 p215

df_exam <- read.csv('./file/exam.csv')
View(df_exam)

#파생변수 total
df_exam$total <- df_exam$math + df_exam$english + df_exam$science
View(df_exam)

#파생변수 mean
df_exam$mean <- df_exam$total / 3
View(df_exam)

#파생변수 grade
df_exam$grade <- ifelse(df_exam$mean >= 90, 'A', 
                        ifelse(df_exam$mean >= 80, 'B', 
                               ifelse(df_exam$mean >= 70, 'C', 
                                      ifelse(df_exam$mean >= 60, 'D', 'F'))))

View(df_exam)

setwd("C:/Users/bigdate/Desktop/workspace/R")


#교재 p217 실습 - 파생변수 생성하기
setwd("C:Rwork/part2")
user_data<-read.csv("user_data.csv",header_T)
head(user_data)
table(user_data$house_type)

house_type2<-ifelse(user_data$house_type==1|
                      user_data$house_type==2,0,1)
house_type2[1:10]

user_data$house_type2<-house_type2
head(user_data)
#교재 p218 실습 - 1:N의 관계를 1:1관계로 파생변수 생성하기
pay_data<-read.csv("pay_data.csv",header="T")
head(pay_data,10)
table(pay_data$product_type)

library(reshapes2)
product_price<-dcast(pay_data,user_Id~product_type,
                     sum,na.rm=T)
head(product_price,3)

names(product_price)<-('user_id','식료품','생필품','의류','잡화','기타')
head(product_price)
#교재 p220 실습 - 고객식별번호(user_id)에 대한 지불유형(pay_method)의 파생변수 생성하기
pay_price<-dcast(pay_data,user_id~pay_method,length)
head(pay_price,3)

names(pay_price)<-c('user_id','현금','직불카드','신용카드','상품권')
head(pay_price,3)

#교재 p220 실습 - 고객정보(user_data) 테이블에 파생변수 추가하기
library(plyr)
user_pay_data<- join(user_data,product_price,by='user_id')
head(user_pay_data,10)

user_pay_data<-join(user_pay_data,pay_price,by='user_id')
user_pay_data[c(1:10),c(1,7:15)]
#교재 p221 실습 - 사칙연산으로 총 구매금액 파생변수 생성하기
user_pay_data<- $총구매금액<-user_pay_data$`식료품`+
  user_pay_data$`생필품`+
  user_pay_data$`의류품`+
  user_pay_data$`잡화`+
  user_pay_data$`기타`

user_pay_data[c(1:10),c(1,7:11,16)]
  
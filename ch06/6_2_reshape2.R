#날짜 : 2021/06/30
#이름 : 김철학
#내용 : Ch06.데이터 조작 - reshape2 패키지 실습 교재 p184

#교재 p184 실습 - reshape2 패키지 설치와 데이터 가져오기
install.packages(reshape2)
data<-read.csv("C;Rwork/part-2/data.csv")
data
library(reshape2)
#교재 p185 실습 - 넓은 형식으로 변경하기
wide<-dcast(data.Customer_ID~Date.sum)
wide
#교재 p185 실습 - 파일 저장 및 읽기
setwd("C:Rwork/Parkt-2")
write.csv(wide,"wide.csv",row.names=FALSE)
wide<-read.csv("wide.csv")
colnames(wide)<-c('Customer_ID','day1','day2','day3','day4',
                  'day5','day6','day7')
wide
#교재 p186 실습 - 넓은 형식의 데이터를 긴 형식으로 변경하기
long<-melt(wide,id="Customer_ID")
long
name<-c("Customer_ID","Date","Buy")
colnames(long)<-name
head(long)
data("smiths")
smiths
long<-melt(id=1:2,smiths)
long
#교재 p186 실습 - smiths 데이터셋 확인하기
dcast(long,subject+time~...)

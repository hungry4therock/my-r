#날짜 : 2021/06/30
#이름 : 김철학
#내용 : Ch06.데이터 조작 - dplyr 패키지 실습 교재 p169

install.packages('dplyr')
library(dplyr)

setwd("C:/Users/bigdate/Desktop/workspace/R")

df_exam <- read.csv('./file/exam.csv')
View(df_exam)

#select - dataframe에서 특정 컬럼을 선택해서 새로운 dataframe 생성
df_math <- df_exam %>% select(math)
df_eng  <- df_exam %>% select(english)
df_rs1  <- df_exam %>% select(math, science)
df_rs2  <- df_exam %>% select(everything())

df_math
df_eng
df_rs1
df_rs2

#filter
df_class1 <- df_exam %>% select(everything()) %>% filter(class==1)
df_class1

#영어점수 60점이상 그리고 80점 미만
df_eng <- df_exam %>% filter(english >= 60 & english < 80)
df_eng

#과학점수 60점이상 또는 80점 이하
df_sci <- df_exam %>% filter(science >= 60 | science <= 80)
df_sci

#SELECT math FROM df_exam WHERE class=1
df_res1 <- df_exam %>% filter(class==1) %>% select(math)
df_res1

#SELECT * FROM df_exam WHERE math > 60 AND math < 80
df_res2 <- df_exam %>% filter(math > 60 & math < 80)
df_res2

#arrange
df_math_asc  <- df_exam %>% arrange(math)
df_math_desc <- df_exam %>% arrange(desc(math))
df_math_asc
df_math_desc

#SELECT class, id, math FROM df_exam WHERE math >= 60 ORDER BY math DESC LIMIT 3;
df_result <- df_exam %>% select(class, id, math) %>% 
  filter(math >= 60) %>% 
  arrange(desc(math)) %>% 
  head(3)

df_result

#mutate - dataframe의 새로운 특정 컬럼(파생변수)를 생성
df_total <- df_exam %>% mutate(total = math+english+science)
df_total

df_mean <- df_total %>% mutate(mean = total / 3)
df_mean

df_grade <- df_mean %>% mutate(grade = ifelse(mean >= 90, 'A',
                                              ifelse(mean >= 80, 'B',
                                                     ifelse(mean >= 70, 'C', 
                                                            ifelse(mean >= 60, 'D', 'F')))))

df_grade

#summarise - dataframe의 특정 컬럼에 대한 요약통계
df_exam %>% summarise(mean_math = mean(math))
df_exam %>% summarise(sum_math = sum(math))

#group_by
df_group1 <- df_exam %>% group_by(class) %>% summarise(sum_math = sum(math))
df_group2 <- df_exam %>% group_by(class) %>% summarise(mean_math = mean(math))

df_group1
df_group2

#inner_join
df_teacher <- data.frame(class   = c(1,2,3,4,5),
                         teacher = c('김유신', '김춘추', '장보고', '강감찬', '이순신'))
df_teacher

df_join <- inner_join(df_exam, df_teacher, by='class')
df_join

#교재 p169 실습 - iris 데이터셋을 대상으로 %>% 연산자를 이용하여 함수 적용하기
install.packages("dplyr")
library(dplyr)
iris %>%  head()
#교재 p170 실습 - dplyr패키지와 hflight 데이터셋 설치
install.packages(c("dplyr","hflights"))
library(dplyr)
#교재 p171 실습 - hflight 데이터셋 구조 보기
str(hflights)
#교재 p171 실습 - tbl_df() 함수 사용하기
hflights_df<-tbl-df(hflights)
hflights_df
#교재 p172 실습 - hflights_df를 대상으로 특정일의 데이터 추출하기
filter(hflights_df,Month==1& DayofMonth==2)
#교재 p173 실습 - hflights_df를 대상으로 지정된 월의 데이터 추출하기
filter(hflights_df,Month==1|Month ==2)
#교재 p174 실습 - hflights_df를 대상으로 데이터 정렬하기
arrange(hflights_df,Year,Month,DepTime,ArrTime)
#교재 p175 실습 - hflights_df를 대상으로 지정된 칼럼 데이터 검색하기
select(hflights_df,Year,Month,DepTime,ArrTime)
#교재 p175 실습 - hflights_df를 대상으로 칼럼의 범위로 검색하기
select(hflights_df,Year:Arrtime)
#교재 p176 실습 - hflights_df에서 출발 지연시간과 도착 지연시간의 차이를 계산한 컬럼 추가하기
mutate(hflights_df,gain=ArrDelay-DepDelay,
       gain_per_hour=gain/(AirTime/60))
#교재 p177 실습 - mutate()함수에 의해 추가된 칼럼 보기
select(mutate(hflights_df,gain=ArrDelay-DepDelay,
              gain_per_hour=gain/(AirTime/60)),
       year,Month,ArrDelay,DepDelay,gain,gain_per_hour)
#교재 p177 실습 - hflights_df에서 비행시간의 평균 구하기
summarise(hflights_df,avgAirTime=mean(AirTime,na.rm=TRUE))
#교재 p178 실습 - hflights_df의 관측치 길이 구하기
summarise(hflights_df,cnt=n(),
          delay=mean(AirTime,na.rm=TRUE))
#교재 p178 실습 - 도착시간의 표준편차와 분산 계산하기
summarise(hflights_df,arrTimeSd=sd(ArrTime,na.rm=TRUE),
          arrTimeVar=var(ArrTime,na.rm=T))
#교재 p178 실습 - 집단변수를 이용하여 그룹화하기
species<-group_by(iris,Species)
str(species)
species
#교재 p180 실습 - 공통변수를 이용하여 내부 조인하기
df1<-data.frame(x=1:5,y=rnorm(5))
df2<-data.frame(x=2:6, z=rnorm(5))
df1
df2

inner_join(df1,df2,by='x')
#교재 p180 실습 - 공통변수를 이용하여 왼쪽 조인하기
left_join(df1,df2,by='x')
#교재 p181 실습 - 공통변수를 이용하여 오른쪽 조인하기
right_join(df1,df2,by='x')
#교재 p181 실습 - 공통변수를 이용하여 전체 조인하기
full_join(df1/df2,by='x')
#교재 p182 실습 - 두 개의 데이터프레임을 행 단위로 합치기
df1<-data.frame(x=1.5,y=rnorm(5))
df2<-data.frame(x=6:10,y=rnorm(5))

df1
df2
df_rows<-bind_rows(df1,df2)
df_rows
#교재 p183 실습 - 두 개의 데이터프레임을 열 단위로 합치기
df_cols<-bind_cols(df1,df2)
df_cols
#교재 p183 실습 - 데이터프레임의 칼럼명 수정하기
df_rename<-rename(df_cols,x2=x1)
df_rename<-rename(df_rename,y2=yq)
df_rename
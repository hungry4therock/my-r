#0
setwd("C:/Users/bigdate/Desktop/workspace/R")
install.packages('dplyr')
library(dplyr)

#1
df_exam<-read.csv('./file/exam.csv')
View(df_exam)

#2
df_math<-df_exam %>% select(math)
df_english<-df_exam %>% select(english)
df_science<-df_exam %>% select(science)

df_rs1<-df_exam %>%  select(math)
df_rs2<-df_exam %>%  select(english)
df_rs3<-df_exam %>%  select(science)


df_math
df_english
df_science

#3
df_rs4<-df_exam %>%  select(everything())
df_class1 <- df_exam %>% select(everything()) %>%  filter(class==1)
df_class1

#4
df_math <- df_exam %>%  filter(math >= 60 & math < 80)
df_math

#5
df_english <- df_exam %>%  filter(english >= 60 & english <80)
df_english

#6  
df_result <- df_exam %>% select(class, id, math) %>% 
  filter(math >= 60) %>% 
  arrange(asc(math)) %>% 
  head(3)
df_result

#7
df_exam %>%  summarise(mean_math = mean(math))

#8
df_total <- df_exam %>% mutate(total = math+english+science)
df_total

#9
df_mean <- df_total %>%  mutate(mean = total/3)
df_mean

#10
df_grade <- df_mean %>%  mutate(grade = ifelse(mean >= 90,'a',
                                               ifelse(mean >= 80,'b',
                                                      ifelse(mean >= 70,'c',
                                                             ifelse(mean >= 60,'d',
                                                                    'f')))))
df_grade

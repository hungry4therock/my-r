#날짜 : 2021/06/29
#이름 : 김철학
#내용 : Ch03.데이터 입출력 - 데이터 불러오기 교재 p95

#컬럼명이 없는 파일 불러오기
student <- read.table('../file/student.txt')
student
class(student)

#컬럼명이 있는 파일 불러오기
student1 <- read.table('../file/student1.txt', header = T)
student1

#구분자가 있는 파일 불러오기
student2 <- read.table('../file/student2.txt', sep=';', header = T)
student2

#결측치를 포함하는 파일 불러오기
student3 <- read.table('../file/student3.txt', header = T, na.strings = '-')
student3

#CSV파일 불러오기
student4 <- read.csv('../file/student4.txt', header = T, na.strings = '-')
student4

#Excel 불러오기
install.packages('readxl')
library(readxl)

student_excel <- read_excel('../file/studentexcel.xlsx')
student_excel

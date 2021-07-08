#날짜 : 2021/06/29
#이름 : 김철학
#내용 : Ch03.데이터 입출력 - 데이터 저장 교재 p101

View(Titanic)

write.csv(Titanic, 
          '../file/titanic.csv', 
          row.names = F, 
          quote = F)


#날짜 : 2021/06/29
#이름 : 김철학
#내용 : Ch05.데이터 시각화 - 박스상자 교재 p148

#박스상자 기본

View(cars)
class(cars)

dist <- cars[,2]
class(dist)

boxplot(dist, main='자동차 제동거리')
boxplot.stats(dist)

#붓꽃 데이터 분석
iris

boxplot(data=iris,
        Sepal.Length ~ Species)



#교재 p148 실습 - VADeaths 데이터셋을 상자그래프로 시각화하기
boxplot(VADeaths,range=0)
boxplot(VADeaths,range=0,notch-"T")
abline(h=37,Ity=3,col="red")
#교재 p149 실습 - VADeaths 데이터셋의 요약통계 보기
summary(VADeaths)

#날짜 : 2021/06/29
#이름 : 김철학
#내용 : Ch05.데이터 시각화 - 파이차트 교재 p147

season <- c('winter', 'summer', 'spring', 'summer', 'summer',
            'autumn', 'autumn', 'summer', 'spring', 'spring')

season
ds <- table(season)
ds


pie(ds, main = 'Season')
pie(ds, main = 'Season', col = terrain.colors(4))

#교재 p148 실습 - 분기별 매출현황을 파이 차트로 시각화하기
par(mfrow=c(1,1))
pie(chart_data,labels=names(chart_data),col=rainbow(8),cex=1.2)
title("2018~2019년도 분기별 매출현황")

#날짜 : 2021/06/29
#이름 : 김철학
#내용 : Ch05.데이터 시각화 - 산점도 교재 p154

View(mtcars)
wt <- mtcars$wt
mpg <- mtcars$mpg

plot(wt, mpg)
plot(wt, mpg, col = 'red', pch=19)

View(iris)
ds_iris <- iris[,3:4]

group <- as.numeric(iris$Species)
group

color <- c('red', 'green', 'blue')

plot(ds_iris, pch=16, col=color[group])

#교재 p154 실습 - 산점도 그래프에 대각선과 텍스트 추가하기
price<-runif(10,min=1,max=100)
plot(price,col="red")
par(new="T")
line_chart=1:100
#대각선추가: 'axes=F'속성과 'ann=F'속성 사용
#x축과 y축의 눈금과 축 이름 제거
plot(line_chart,type="I",col="red",axes=F,ann=F)
#교재 p155 실습 - type 속성으로 산점도 그리기
par(mfrow=c(2,2))
plot(price,type="I")
plot(price,type="O")
plot(price,type="h")
plot(prce,type="h")
plot(price,type="s")

#교재 p156 실습 - pch 속성으로 산점도 그리기
par(mfrow=c(2,2))
plot(price,type="O",pch=5)
plot(price,type="O",pch=15)
plot(price,type="O",pch=20,col="blue")
plot(price,type="O",pch=20,col="orange",cex=1.5)

par(mfrow-c(1,1))
#iwd:line width(선 굵기)
plot(price,type="O",pch=20,
     col="green",cex=2.0,lwd=3)

x<-c(1,2,3,4,2,4)
y<-rep(2,6)
x;y
plot(x,y)
xy.df<-as.data.frame(table(x,y))
xy.df

library(UsingR)
data(galton)
galtonData<-as.data.frame(table(galton&child,galton$parent))
head(galtonData)

names(galtonData)=c("child","parent","freq")
head(galtonData)
parent<-as.numeric(galtonData$parent)
child<-as.numeric(galtonData$child)

plot(parent,child,
     pch=21,col="blue",bg="green",
     cex=0.2*galtonData$freq,
     xlab="parent",ylab="child")

#교재 p162 실습 - iris 데이터셋의 4개 변수를 상호 비교
attributes(iris)
pairs(iris[iris$Species=="virginica",1:4])
pairs(iris[iris$Species=="setosa",1:4])

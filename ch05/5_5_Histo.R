#날짜 : 2021/06/29
#이름 : 김철학
#내용 : Ch05.데이터 시각화 - 히스토그램 교재 p150

View(cars)
class(cars)

dist <- cars[,2]
dist

barplot(dist)
hist(dist)

# iris 데이터 히스토그램
hist(iris$Sepal.Width, 
     xlim = c(2.0, 4.5),
     xlab = '꽃받침 너비',
     main = '꽃받침 너비 분포도')


#교재 p150 실습 - iris 데이터셋 가져오기
data(iris)
names(iris)
str(iris)
head(iris)
#교재 p150 실습 - iris 데이터셋의 꽃받침 길이(Sepal.Length)로 히스토그램 시각화하기
summary(iris$Sepal.Length)
hist(iris$Sepal.Length.xlab="iris$Sepal.Length", col="magenta",main="iris꽃받침 길이 Histogram",xlim=c(4.3,7.9))
#교재 p151 실습 - iris 데이터셋의 꽃받침 너비(Sepal.Width)로 히스토그램 시각화하기
summary(iris$Sepal.Length.width)
hist(iris$Sepal.Width,xlab = "iris$Sepal.width", col = "mistyrose", main = "iris 꽃받침 너비 Histogram", xlim=c(2.0,4.5))
#교재 p152 실습 - 히스토그램에서 빈도와 밀도 표현하기
par(mfrow=c(1,2))
hist(iris$Sepal.Width,xlab="iris$Sepal.width", col="mistyrose", freq = "F",
     main = "iris 꽃받침 너비 Histogram:확률밀도",xlim=c(2.0,4.5))
#교재 p152 실습 - 정규분포 추정 곡선 나타내기
par(mfrow(c(1,1)))
hist(iris$Sepal.Width,xlab="iris$Sepal.width",col="mistyrose", freq = F., main = "iris 꽃받침 너비 Histogram",
     xlim=c(2.0,4.5))
line(density(iris$Sepal.Width),col-"red")
x<-seq(2.0,4.5,0.1)
curve(dnorm(x,mean = mean(iris$Sepal.Width),
            sd=sd(iris$Sepal.Width)),
      col="blue",add="T")


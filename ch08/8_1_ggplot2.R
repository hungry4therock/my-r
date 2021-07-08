#날짜 : 2021/07/01
#이름 : 김철학
#내용 : Ch08.고급 시각화 분석 - ggplot2 패키지 실습 교재 p259

setwd("C:/Users/bigdate/Desktop/workspace/R")
install.packages('ggplot2')
library(ggplot2)

################################
#막대차트
################################
mtcars
mtcars_table <- table(mtcars$cyl)
mtcars_table

#R 기본 막대차트
barplot(mtcars_table)

#ggplot2 막대차트
qplot(data = mtcars, x=cyl, geom = 'bar')
ggplot(mtcars, aes(x=cyl)) + geom_bar() 


################################
#라인차트
################################
economics
View(economics)

#R 기본 라인차트
plot(economics$date, economics$unemploy, type='l')

#ggplot2 라인차트
qplot(data=economics, x=date, y=unemploy, geom='line')
ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line()

################################
#박스상자
################################
mpg
View(mpg)

#R 기본 박스상자
boxplot(mpg$hwy ~ mpg$drv)

#ggplot2 박스상자
qplot(data=mpg, x=drv, y=hwy, geom='boxplot')
ggplot(data=mpg, aes(x=drv, y=hwy)) + geom_boxplot()

################################
#히스토그램램
################################
iris
View(iris)

#R 기본 히스토그램
hist(iris$Sepal.Width)

#ggplot2 히스토그램
qplot(data=iris, x=Sepal.Width, geom='histogram')
ggplot(data=iris, aes(x=Sepal.Width)) + geom_histogram()


#R 기본 산점도
plot(iris[,3:4], pch=16, col=iris$Species)

#ggplot2 산점도
qplot(data=iris, 
      x=Petal.Length, 
      y=Petal.Width, 
      color=Species, 
      geom='point')

ggplot(data=iris, 
       aes(x=Petal.Length, y=Petal.Width, color=Species)) + geom_point()

#p234
install.packages("lattice")
library(lattice)

install.packages("mlmRev")
library(mlmRev)
data(Chem97)
str(Chem97)
head(Chem8,30)
Chem97

#236
histogram(~gcsescore,data=Chem97)

#238
dentisyplot(~gcsescore|factor(score),data=Chem97,
            groups=gender,
            plot.points=T,auto.key=T)

#p239
data("VADeaths")
class(VADeaths)
mode(VADeaths)

dft=as.data.frame.table(VADeaths)
str(dft)
dft

barchart(Var1~Fewq|Var2,data=dft,layout=c(4,1),origin=0)

#241
dotplot(Var1~Freq|Var2,dft)

dotPlot(Var1~Freq|Var2,dft,ladyout=c(4,1))

dotplot(Var1~Freq,data=dft,
        groups=Va2,type="0",
        auto.key=list(space="right",points=T,lines=T))

#243
library(datasets)
str(airquality)

xyplot(Ozone~Wind,data=airquality)

xyplot(Ozone~Wind|Month,data=airquality)

xyplot(Ozone~Wind|Month,data=airquality,layout=c(5,1))

convert<-transform(airquality,Month=factor(Month))
str(convert)
xyplot(Ozone~Wind|Month,data=convert)

#p246
head(quakes)
str(quakes)

xyplot(lat~long,data=quakes,pch=".")

tplot<-update(tplot,main="지진위치")
print(tplot)

#247
range(quakes$depth)

quakes$depth2[quakes$depth>=40 & quakes$depth<=150]<-1
quakes$depth2[quakes$depth>=151 & quakes$depth<=250]<-2
quakes$depth2[quakes$depth>=251 & quakes$depth<=350]<-3
quakes$depth2[quakes$depth>=351 & quakes$depth<=450]<-4
quakes$depth2[quakes$depth>=451 & quakes$depth<=550]<-5
quakes$depth2[quakes$depth>=551 & quakes$depth<=680]<-6

covert<-transform(quakes,depth2=factor(depth2))
xyplot(lat~long|depth2,data=convert)

xyplot(Ozone+Solar.R~Wind|factor(Month),
       data=airquality,
       col=c("blue","red"),
       layout=c(5,1))

#249
numgroup<-equal.count(1:150,number=4,overlap=0)
numgroup

depthGroup<-equal.count(quakes$depth,number=5,overlap=0)
depthGroup

xyplot(lat~long|depthgroup,data=quakes,
       main="Fiji Earthquakes(depthgroup)",
       ylab="latitude",xlab="longitude",
       pch="@",col="red")

#251
magnitudegroup<-equal.count(quakes$mag,number=2,overlap=0)
magnitudegroup

xyplot(lat~long|magnitudegroup,data=quakes,
       main="Fiji Earthquakes(magnitude)",
       ylab="latitude",xlab="longitude",
       pch="@",col=c("red","blue"))
#253
quakes$depth3[quakes$depth>=39.5 & quakes$depth<=80.5]<-'d1'
quakes$depth3[quakes$depth>=79.5 & quakes$depth<=186.5]<-'d2'
quakes$depth3[quakes$depth>=185.5 & quakes$depth<=397.5]<-'d3'
quakes$depth3[quakes$depth>=396.5 & quakes$depth<=562.5]<-'d4'
quakes$depth3[quakes$depth>=562.5 & quakes$depth<=680.5]<-'d5'

quakes$mag3[quakes$msg>=3.95 & quakes$depth<=4.65]<-'m1'
quakes$mag3[quakes$msg>=4.55 & quakes$depth<=6.45]<-'m2'

convert<- transform(quakes,
                    depth3=factor(depth3),
                    mag3=factor(mag3))

xyplot(lat~long|depth3*mag3,data=covert,
       main="Fiji Earthquakes",
       ylab="latitude",xlab="longitude",
       pch="@",col=c("red","blue"))

#254
coplot(lat~long|depth,data=quakes)
coplot(lat~long|data=quakes,
       overlap=0.1)

coplot(lat~longdepth,data = quakes,
       number=5,row=1)

#256
coplot(lat~long|depth,data=quakes,
       number = 5,row=1,
       panel = panel.smooth)

coplot(lat~long|depth,data=quakes,
       number=5,row=1,
       col='blue',
       bar.bg=c(num='green'))

cloud(depth~lat*long,data=quakes,
      zlim=rev(range(quakes$depth)),
      xlab="경도",ylab="위도",zlab="깊이")

cloud(depth~lat*long,data=quakes,
      zlim=rev(range(quakes$depth)),
      panel.aspect=.9,
      screen=list(z=45,x=-25),
      xlab="경도",ylab="위도",zlab="깊이")

#259
install.packages("ggplot2")
library(ggplot2)
data(mpg)
str(mpg)
head(mpg)
table(mpg$drv)

#261
qplot(hwy,data=mpg)
qplot(hwy,data=mpg,fill=drv)
qplot(hwy,data=mpg,fil=drv,
      binwidth=2)

#262
qplot(hwy,data=mpg,fill=drv,
      facets = drv~.,
      binwidth=2)

qplot(displ,hwy,data=mpg)
qplot(displ,hwy,data=mpg,color=drv)

#264
qplot(displ,hwy,data=mpg,color=drv,facets=.~drv)

#264
head(mtcars)
qplot(wt,mpg,data=mtcars,color=factor(carb))
qplot(wt,mpg,data=mtcars,size-qsec,color=factor(carb))
qplot(wt, mpg, data=mtcars, size=qsec, color=factor(carb),shape=factor(cyl))

#266
head(diamonds)
qplot(clarity,data=diamonds,fill=cut,geom="bar")
qplot(clarity,data = diamonds,fill=cut,geom = "bar")
qplot(wt,mpg,data=mtcars,size=qsec,geom = "point")
qplot(wt,mpg,data = mtcars,size=factor(cyl),
      color=factor(carb),geom="point")
qplot(wt,mpg,data=mtcars,size=qsec,
      color=factor(carb),
      shape=factor(cyl),geom="point")
qplot(wt,mpg,data=mtcars,
      geom=c("point","smooth"))
qplot(wt,mpg,data=mtcars,color=factor(cyl),
      geom=c("point","smooth"))
qplot(mpg,wt,data = mtcars,
      color=factor(ctl),geom="line")
qplot(mpg,wt,data=mtcars,
      color=factor(cyl),geom=c("point","line"))

#270
p<-ggplot(diamonds,aes(carat,price,color=cut))
p+geom_point()

p<-ggplot(mtcars,aes(mpg,wt,color=factor(cyl)))
p+geom_point()

#271
p<-ggplo(mtcars,aes(mpg,wt,color=factor(cyl)))
p+geom_line()

p<-ggplot(mtcars,aes(mpg,wt,color=factor(cyl)))
p+geom_point()

p<-ggplot(diamonds,aes(price))
p+stat_bin(aes(fill=cut),geom="bar")

p+stat_bin(aes(fill=..density..),geom="bar")

#274
p<-ggplot(diamonds,aes(price))
p+stat_bin(aes(fill=cut),geom="area")

p+stat_bin(aes(color=cut,
               size=..density..),geom="point")

#274
library(UsingR)
data("galton")
p<-ggplot(data=galton,aes(x=parent,y=child))
p+geom_count()+geom_smooth(method="Lm")

#275
p<-ggplot(diamonds,aes(carat,price,color=cut))
p<-p+geom_point()+ggtitle("다이아몬드 무게와 가격의 상관관계")
print(p)

p+theme(
  title = element_text(color = "blue",size = 25),
  axis.title = element_text(size=14,face="bold"),
  axis.title.x = element_text(color = "green"),
  axis.title.y = element_text(color = "green"),
  axis.text = eleemnt_text(size=14),
  axis.text.y=element_text(color="red"),
  axis.text.x=element_text(color="purple"),
  legnend.title=element_text(size=20,face="bold",
                             color = "red"),
  legnend.position = "bottom",
  legend.direction = "horizontal"
  
#277
p<-ggplot(diamonds,aes(carat,price,color=cut))
p+geom_point()

ggsave(file="C:Rowork/out/doa,pmd_price.pdf"),
ggsave(file-"C:Rwork/output/diamond_price.jpg",dpi = 72)

p<-ggpot(diamonds,aes(clarity))
p<-p+geom_bar(aes(fill=cut),positon="fill")
ggsave(file="C:Rwork/output/bar.png",
       plot=p,width = 10, height = 5)

p<-ggplot(diamonds,aes(clarity))
p<-p+geom_bar(aes(fill=cut),positon="fill")
ggsave(file="C:Rwork/output/bar.png",
       plot = p, width = 10, height = 5)

library(ggplot2)
install.packages("ggmap")
library(ggmap)
  
seoul<-c(left=126.77,bottom=37.40,
         right=127.17, top=37.70)
map<-get_stamenmap(seoul,zoom=12,maptype = "terrain")

pop<-read.csv(fill.choose(),header = T)
library(stringr)

region<-pop#'지역명'
lon<-pop$LON
lat<-pop$LAT
tot_pop<-as.numeric(str_replace_all(pop$'총인구수',',',',',''))
df_data.frame(region,lon,lat,tot_pop)
df
df<-df[1:7]
df

daegu<-c(left=123.4423013,bottom=32.829355,
         right=131.601445,top=38.8714354)
map<- get_steamenmap(daegue,zoom=7,maptype='watercolor')

layer1=ggmap(map)
layer1

layer2<-layer1+geom_point(data=df,
                          aes(x=lon,y=lat,
                              color=factor(tot_pop,
                                           size=factor(tot_pop))))
layer2

layer3<-layer2=geom_text(data=df,
                         aes(x=lon=.01,y=lat=.08,
                             lable=rigion),size=3)
layer3

ggsave("pop201901.png",scale=1,width=10.24,height = 7.68)




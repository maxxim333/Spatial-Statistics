#http://spatstat.org/SSAI2017/solutions/solution05.html

#install.packages("spatstat")
library(spatstat)

#Info
?mucosa
plot(mucosa)

#Intensity
quadratcount(mucosa)

plot(mucosa, chars=c(1,2,3), cols=c("red", "green","blue"))
plot(quadratcount(mucosa), add=TRUE)
quadrat.test(mucosa)
plot(mucosa, chars=c(1,2,3), cols=c("red", "green","blue"))
plot(quadrat.test(mucosa), add=TRUE)

#Splitting
plot(split(mucosa), main="Split Data")
plot(quadratcount(split(mucosa)),main = "Split data")
plot(quadrat.test(split(mucosa)))

a<-as.data.frame((split(mucosa))[1])
pp1<-ppp(a$ECL.x, a$ECL.y)
quadrat.test(pp1)
#plot(quadrat.test(pp1))

b<-as.data.frame((split(mucosa))[2])
pp2<-ppp(b$other.x, b$other.y)
plot(quadrat.test(pp2))
quadrat.test(pp2)




#Interpoint interaction
par(mfrow=c(3,1))
par(mai=c(0.2,0.5,0.3,0.3))
miplot(mucosa,main="Miplot for whole dataset")
miplot(pp2, main="Miplot for other")
miplot(pp1, main="Miplot for ECL")


dev.off()
par(mfrow=c(3,1))
fryplot(mucosa)
fryplot(pp2)
fryplot(pp1)

?distmap
plot(distmap(mucosa))

#Summary Statistics
unmarked<-unmark(mucosa)
allstats(unmarked)
plot(allstats(unmarked))


#Envelope

plot(envelope(mucosa))
plot(envelope(pp2))
plot(envelope(pp1))


#Rel Risk
dev.off()
par(mfrow=c(1,2))
plot(relrisk(mucosa, hmax = 1, relative= FALSE, control = "other"))
plot(relrisk(mucosa, hmax = 1, relative = FALSE, control = "ECL", main="Other"))



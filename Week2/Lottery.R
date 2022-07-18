lotteryCard<-c(2,5,8)


winningNumbers1<-sample(10,5)
winningNumbers2<-sample(10,5)
winningNumbers3<-sample(10,5)
winningNumbers4<-sample(10,5)
winningNumbers5<-sample(10,5)


sum(lotteryCard%in%winningNumbers1)
sum(lotteryCard%in%winningNumbers2)
sum(lotteryCard%in%winningNumbers3)
sum(lotteryCard%in%winningNumbers4)
sum(lotteryCard%in%winningNumbers5)

winningNumbers1
winningNumbers2
winningNumbers3
winningNumbers4
winningNumbers5

winningNumbers1<-sample(10,5,prob=c(0.066,.18,0.066,0.066,.18,0.066,0.066,.18,0.066,0.066))
winningNumbers2<-sample(10,5,prob=c(0.066,.18,0.066,0.066,.18,0.066,0.066,.18,0.066,0.066))
winningNumbers3<-sample(10,5,prob=c(0.066,.18,0.066,0.066,.18,0.066,0.066,.18,0.066,0.066))
winningNumbers4<-sample(10,5,prob=c(0.066,.18,0.066,0.066,.18,0.066,0.066,.18,0.066,0.066))
winningNumbers5<-sample(10,5,prob=c(0.066,.18,0.066,0.066,.18,0.066,0.066,.18,0.066,0.066))

sum(lotteryCard%in%winningNumbers1)
sum(lotteryCard%in%winningNumbers2)
sum(lotteryCard%in%winningNumbers3)
sum(lotteryCard%in%winningNumbers4)
sum(lotteryCard%in%winningNumbers5)

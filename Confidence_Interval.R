## Confidence_Interval.R
## Ref: https://rpubs.com/james_datacatcher/ch10

##### Presetting ######
rm(list = ls()) # Clean variable
memory.limit(150000)

c_mean <- 370.16    #樣本平均數
c_sd <- 75          #給定標準差
n <- 25             #樣本

plot(x=c(300,450),  #劃出一個空白兩個維度的框架，X座標為300~450
     y=c(0,110),    #訂出Y軸的座標為0~110
     type = "n")    #不畫任何點或線

abline(v = c_mean,  #劃出平均數位置的線
       lty = 2,     #選擇虛線
       col = "red") #選擇紅色

for(i in 1:100)
{
  x = rnorm(25 , c_mean , c_sd)          #隨機產生一組以(n,c_mean,c_sd)為參數

  width = qt(0.975 , n-1)*sd(x)/sqrt(n)  #計算95%信賴區間估計誤差的界線(bound on the error of estimation)

  ## Ref: https://www.r-china.net/forum.php?mod=viewthread&tid=20386&page=1
  ## R語言學生t分布qt()函數


  left = mean(x)-width                   #信賴區間下限(Lower confidence limit)
  right = mean(x)+width                  #信賴區間上限(Upper confidence limit)

  if (c_mean >= left && c_mean <= right) #抽樣結果落在區間內
  { lines(c(left,right),                 #X軸位置連接上下限
          c(i,i),                        #Y軸位置連接上下限
          lty = 2)                       #選擇虛線
  }
  else                                   #抽樣結果不落在區間內
  {
    lines(c(left,right),                 #X軸位置連接上下限
          c(i,i),                        #Y軸位置連接上下限
          lty = 1,                       #選擇實線
          lwd = 2)                       #選擇兩倍線寬
  }

}

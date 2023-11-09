#pakage
install.packages("readxl") ;  install.packages("ggplot2") ;install.packages("zoo")
library(readxl) ;library(ggplot2) ;library(zoo)

# data
DF <- read_excel("data/2/存放款.xlsx")

DR <- as.numeric(DF$存款) 
LR <- as.numeric(DF$放款)
SR <- as.numeric(DF$利差)
Time <- as.numeric(DF$date)
DF$date <- as.yearqtr(format(Time), "%Y%q")


#plot
ggplot(DF, aes(date)) + 
  geom_line(aes(y = DR, col = "Deposit rate"),size=0.6) + 
  geom_line(aes(y = LR, col = "Lending Rate"),size=0.6) +
  geom_line(aes(y = SR, col = "Spread"),size=0.6) +
  
  ggtitle("金融界存放款利差比較") +
  xlab("Time") + ylab("Interest rate(%)") +
  
  theme(plot.margin=unit(c(1,1,1,1),'cm'))+
  theme(aspect.ratio = 3/5, 
        plot.title = element_text(size = 14 , hjust = 0.5, vjust = 0.5, face = "bold"), 
        legend.position = "bottom" 
        )


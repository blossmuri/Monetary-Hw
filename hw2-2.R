# pakage
install.packages("readxl") ;  install.packages("ggplot2") ;install.packages("zoo")
library(readxl) ;library(ggplot2) ;library(zoo)

# date
DF <- read_excel("data/2/University of Michigan inflation expectations.xlsx")

MICH     <-  DF$MICH
T10YIE   <-  DF$T10YIE
Exp1y    <-  DF$Exp1
Exp3y    <-  DF$Exp3
USCPI    <-  DF$US

DF2 <- read_excel("data/2/Survey of Professional Forecasters.xlsx")

ProExp1y  <- DF2$PExp1
ProExp10y <- DF2$PExp10


# 創建日期時間序列
ts1 <- data.frame(
  time = seq(from = as.POSIXct("2020-01-01 00:00:00"), by = "1 month", length.out = 45 ),
  MICH = MICH 
 
)

ts2 <- data.frame(
  time = seq(from = as.POSIXct("2020-01-01 00:00:00"), by = "1 month", length.out = 45 ),
  T10YIE =T10YIE
)

ts3 <- data.frame(
  time = seq(from = as.POSIXct("2020-01-01 00:00:00"), by = "1 month", length.out = 45 ),
  Exp1y=Exp1y
)


ts4 <- data.frame(
  time = seq(from = as.POSIXct("2020-01-01 00:00:00"), by = "1 month", length.out = 45 ),
  Exp3y=Exp3y
)

ts5 <- data.frame(
  time = seq(from = as.POSIXct("2020-01-01 00:00:00"), by = "1 month", length.out = 45 ),
  USCPI =USCPI 
)


ts6 <- data.frame(
  time = seq(from = as.POSIXct("2020-02-01 00:00:00"), by = "3 month", length.out = 15),
  ProExp1y=ProExp1y
  
)

ts7 <- data.frame(
  time = seq(from = as.POSIXct("2020-02-01 00:00:00"), by = "3 month", length.out = 15),
  ProExp10y=ProExp10y
) 

# plot
ggplot() +
  geom_line(data = ts1, aes(x = time, y = MICH, color = "MICH"),size=0.75) +
  geom_line(data = ts2, aes(x = time, y = T10YIE, color = "T10YIE"),size=0.75) +
  geom_line(data = ts3, aes(x = time, y = Exp1y, color = "Exp1y"),size=0.75) +
  geom_line(data = ts4, aes(x = time, y = Exp3y, color = "Exp3y"),size=0.75) +
  geom_line(data = ts5, aes(x = time, y = USCPI, color = "USCPI"),size=0.75) +
  geom_line(data = ts6, aes(x = time, y = ProExp1y , color = "ProExp1y"),size=0.75) +
  geom_line(data = ts7, aes(x = time, y = ProExp10y, color = "ProExp10y"),size=0.75) +
  
  ggtitle("Inflation & Inflation Expectation") +
  labs(x = "Time", y = "Inflation rate (%)") +
  
  theme_minimal() +
  theme(plot.margin=unit(c(2,1,2,1),'cm'))+
  theme(aspect.ratio = 3/5,
        plot.title = element_text(size = 14, hjust = 0.5, vjust = 0.5, face = "bold"), 
        legend.position = "right",
        legend.text = element_text(size = 7)
        )

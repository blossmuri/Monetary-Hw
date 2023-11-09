#pakage
install.packages("lmtest") ; install.packages("vars") ; install.packages("readxl") 
library(lmtest) ; library(ggplot2) ; library(vars) ; library(readxl)

#data
DF <- read_excel("data/2/Federal Funds Effective Rate.xlsx")

Fed <- DF$FED
Tw <- DF$TW
DF$date <- as.Date(DF$date)

#plot
ggplot(DF, aes(x = date)) +
  geom_line(aes(y = Fed, color = "Fed"),size=0.75) +
  geom_line(aes(y = Tw, color = "Tw"),size=0.75) +
  
  ggtitle("Effective Fed Fund rate & Tw Overnight Rate") +
  labs(x = "Time", y = "Interest rate (%)") +
  
  theme_minimal() + 
  theme(plot.margin=unit(c(2,1,2,1),'cm'))+
  theme(legend.position = "bottom", 
        plot.title = element_text(size = 14, hjust = 0.5, vjust = 0.5, face = "bold"), 
        aspect.ratio = 3/5, 
        )

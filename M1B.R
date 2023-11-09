install.packages("lmtest") ; install.packages("vars") ; install.packages("readxl") 
library(lmtest) ; library(ggplot2) ; library(vars) ; library(readxl)

M <- read_excel("C:/Users/Tr7/OneDrive/課業/貨銀/作業/資料/ms.xlsx")
M1B <- M$M1B
M2 <- M$M2

# 將日期轉換為Date類型
M$date <- as.Date(M$date)

# 使用ggplot2的主題和自定義外觀
ggplot(M, aes(x = date)) +
  geom_line(aes(y = M1B, color = "M1B"), linetype = "solid", size = 1) +
  geom_line(aes(y = M2, color = "M2"), linetype = "solid", size = 1) +
  scale_color_manual(values = c("M1B" = "#0072B2", "M2" = "#D55E00")) +  # 更改顏色，使用Hex色碼
  labs(title = "M1B和M2的年增率走勢",
       x = "日期(月資料)",
       y = "年增率(%)",
       color = "指標") +
  theme_minimal() +  # 使用最小化主題
  theme(legend.position = "top",  # 將圖例移到上方
        plot.title = element_text(size = 14, face = "bold"),  # 調整標題字體大小和粗體
        axis.title = element_text(size = 12),  # 調整軸標籤字體大小
        axis.text = element_text(size = 10),  # 調整軸刻度字體大小
        legend.title = element_text(size = 12),  # 調整圖例標題字體大小
        legend.text = element_text(size = 10))  # 調整圖例文字字體大小

#corr
correlation <- cor(M1B, M2)
print(correlation)

#max
print(max(M1B)) 
print(which.max(M1B))  
print(max(M2)) 
print(which.max(M2))  





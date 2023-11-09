install.packages("lmtest") ; install.packages("vars") ; install.packages("readxl") 
library(lmtest) ; library(ggplot2) ; library(vars) ; library(readxl)

yeild <- read_excel("C:\\Users\\Tr7\\OneDrive\\課業\\貨銀\\作業\\資料\\us10.xlsx")
Tw10yr <- yeild$tw
Us10yr <- yeild$us
spread <- yeild$spread

# 將日期轉換為Date類型
yeild$date <- as.Date(yeild$date)

# 使用ggplot2的主題和自定義外觀
ggplot(yeild, aes(x = date)) +
  geom_line(aes(y = Tw10yr, color = "Tw10yr"), linetype = "solid", size = 1) +
  geom_line(aes(y = Us10yr, color = "Us10yr"), linetype = "solid", size = 1) +
  geom_line(aes(y = spread, color = "spread"), linetype = "solid", size = 1) +
  scale_color_manual(values = c("Tw10yr" = "#0072B2", "Us10yr" = "#D55E00","spread" = "black")) +  # 更改顏色，使用Hex色碼
  labs(title = "Tw10yr & Us10yr",
       x = "日期(月資料)",
       y = "利率(%)",
       color = "指標") +
  theme_minimal() +  # 使用最小化主題
  theme(legend.position = "top",  # 將圖例移到上方
        plot.title = element_text(size = 14, face = "bold"),  # 調整標題字體大小和粗體
        axis.title = element_text(size = 12),  # 調整軸標籤字體大小
        axis.text = element_text(size = 10),  # 調整軸刻度字體大小
        legend.title = element_text(size = 12),  # 調整圖例標題字體大小
        legend.text = element_text(size = 10))  # 調整圖例文字字體大小


#corr
correlation <- cor(Tw10yr, Us10yr)
print(correlation)
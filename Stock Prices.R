install.packages("quantmod")
library(quantmod)
library(plyr)

setSymbolLookup(QQQ='yahoo',SPY='yahoo')
getSymbols('MSFT', from = as.Date("2016-01-01"))
getSymbols('AMZN', from = as.Date("2016-01-01"))
getSymbols('GOOG', from = as.Date("2016-01-01"))
getSymbols('AAPL', from = as.Date("2016-01-01"))
getSymbols('FB', from = as.Date("2016-01-01"))
getSymbols('CRM', from = as.Date("2016-01-01"))

Microsoft_Share_Price <- data.frame(MSFT)
Amazon_Share_Price <- data.frame(AMZN)
Google_Share_Price <- data.frame(GOOG)
Apple_Share_Price <- data.frame(AAPL)
Facebook_Share_Price <- data.frame(FB)
Salesforce_Share_Price <- data.frame(CRM)

Microsoft_Share_Price <- cbind(rownames(Microsoft_Share_Price),Microsoft_Share_Price)
rownames(Microsoft_Share_Price) <- NULL
colnames(Microsoft_Share_Price) <- c("Date","MSFT.Open","MSFT.High", "MSFT.Low", "MSFT.Close", "MSFT.Volume", "MSFT.Adjusted")

Amazon_Share_Price <- cbind(rownames(Amazon_Share_Price),Amazon_Share_Price)
rownames(Amazon_Share_Price) <- NULL
colnames(Amazon_Share_Price) <- c("Date","AMZN.Open","AMZN.High", "AMZN.Low", "AMZN.Close", "AMZN.Volume", "AMZN.Adjusted")

Google_Share_Price <- cbind(rownames(Google_Share_Price),Google_Share_Price)
rownames(Google_Share_Price) <- NULL
colnames(Google_Share_Price) <- c("Date","GOOG.Open","GOOG.High", "GOOG.Low", "GOOG.Close", "GOOG.Volume", "GOOG.Adjusted")

Apple_Share_Price <- cbind(rownames(Apple_Share_Price),Apple_Share_Price)
rownames(Apple_Share_Price) <- NULL
colnames(Apple_Share_Price) <- c("Date","AAPL.Open","AAPL.High", "AAPL.Low", "AAPL.Close", "AAPL.Volume", "AAPL.Adjusted")

Facebook_Share_Price <- cbind(rownames(Facebook_Share_Price),Facebook_Share_Price)
rownames(Facebook_Share_Price) <- NULL
colnames(Facebook_Share_Price) <- c("Date","FB.Open","FB.High", "FB.Low", "FB.Close", "FB.Volume", "FB.Adjusted")

Salesforce_Share_Price <- cbind(rownames(Salesforce_Share_Price),Salesforce_Share_Price)
rownames(Salesforce_Share_Price) <- NULL
colnames(Salesforce_Share_Price) <- c("Date","CRM.Open","CRM.High", "CRM.Low", "CRM.Close", "CRM.Volume", "CRM.Adjusted")

Key_Share_Price1 <- data.frame(Microsoft_Share_Price$Date, Microsoft_Share_Price$MSFT.Open, Amazon_Share_Price$AMZN.Open, Google_Share_Price$GOOG.Open, Apple_Share_Price$AAPL.Open, Facebook_Share_Price$FB.Open, Salesforce_Share_Price$CRM.Open)

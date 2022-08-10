library(shiny)
library(shinydashboard)
library(quantmod)
library(shinyWidgets)
library(dplyr)
library(fpp3)
library(xts)
library(lubridate)

SYMBOLS <- stockSymbols()

SYMBOLS <- SYMBOLS %>% 
  mutate(SYMBOLNAMECOMBO = paste(Symbol,"-",Name))

SYMBOLS <- SYMBOLS %>% 
  subset(Exchange %in% c("NASDAQ","NYSE"),
         select = -c(Industry,Sector,IPOyear,MarketCap,LastSale,Next.Shares,ACT.Symbol,CQS.Symbol,NASDAQ.Symbol,Round.Lot.Size,Test.Issue,Market.Category))

clean_names <- function(stocks) {
  split_names <- strsplit(names(stocks), split = ".", fixed = TRUE)
  vapply(split_names, function(x) x[2], character(1))
}
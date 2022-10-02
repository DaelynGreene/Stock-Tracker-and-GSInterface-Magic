library(rvest)
library(gmailr)

FirstTrustCPST61 <- "https://www.ftportfolios.com/retail/dp/dpsummary.aspx?fundid=16790"

PriceWebsiteCPST61 <- session(FirstTrustCPST61)

PriceCPST61 <- PriceWebsiteCPST61 %>%
  html_element("#ContentPlaceHolder1_Dpsummary1_lblNAV") %>%
  html_text2()

PriceCPST61 <- gsub("[$]","",PriceCPST61)

PriceCPST61 <- as.numeric(PriceCPST61)

DepositAmount <- 6000

NumberOfShares <- 563 #HOW TO UPDATE THIS???????????????????????????????

Dividend <- #scrub first trust's table..... but when? see 40-49 for how to do

FreeCash <- 4.78  
  
SharesWorth <- PriceCPST61 * NumberOfShares

TotalAccountWorth <- SharesWorth + FreeCash












FirstTrustCPST50 <- "https://www.ftportfolios.com/Retail/dp/dpdistributions.aspx?fundid=14713"

GuineaPig <- session(FirstTrustCPST50)

NoClueHowThisWorks <- GuineaPig %>% 
  html_table()

TEST <- NoClueHowThisWorks[[1]]

FirstDividendPayment <- as.numeric(gsub("[$]","",TEST$X55[1]))





gm_auth_configure("606976777155-oc946r8lecfceaafhm7k5dekhampohp0.apps.googleusercontent.com","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")

gm_send_message(
 gm_mime() %>%
  gm_from("patbackthebackpack@gmail.com") %>%
  gm_to("daelyn.greene865@gmail.com") %>%
  gm_subject(paste("Daily Summary for",Sys.Date())) %>%
  gm_text_body(paste("The closing price of Series 61 was",paste0(PriceCPST61,"."),"My current Roth worth is",paste0("$",TotalAccountWorth,".")))
)


# If (weekdays(Sys.Date()) == "Sunday") {
# } else if (weekdays(Sys.Date()) %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday") {
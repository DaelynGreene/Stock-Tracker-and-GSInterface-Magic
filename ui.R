ui <- dashboardPage(
  
  dashboardHeader(title = "Stocks"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dividend Requirement Input", tabName = "Tab1") 
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "Tab1",
        uiOutput("dividendinputbox"),
        uiOutput("etfstockradiobuttons"),
        uiOutput("nysenasdaqradiobuttons"),
        uiOutput("gobutton"),
        uiOutput("dropdown")
      )
      )
    )
)
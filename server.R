server <- function(input, output, session) {
  
  output$dividendinputbox <- renderUI(
    fluidRow(
      column(
      width = 12,
      align = "center",
      textInput(
      inputId = "dividendpayoutpercentage",
      label = h3("Input Your Desired MINIMUM Dividend Payout Percentage"),
      value = ""
    )
  )
    )
  )
  
  output$etfstockradiobuttons <- renderUI(
    fluidRow(
      column(
        width = 12,
        align = "center",
    radioButtons(
      inputId = "kindyouresearchingfor",
      label = h3("Pick What Kind You Want to Search For"),
      choices = c("Make A Selection","Stock","ETF","Both"),
      selected = "Make A Selection",
      inline = T
    )
  )
  )
  )
  
  output$nysenasdaqradiobuttons <- renderUI(
    fluidRow(
      column(
        width = 12,
        align = "center",
        radioButtons(
          inputId = "exchangeyouresearchingfor",
          label = h3("Pick What Exchange You Want to Search On"),
          choices = c("Make A Selection","NASDAQ","NYSE","Both"),
          selected = "Make A Selection",
          inline = T
        )
      )
    )
  )
  
  output$gobutton <- renderUI(
    fluidRow(
      column(
        width = 12,
        align = "center",
    actionButton(
      inputId = "confirmdividendpayout",
      label = "Make The Magic Happen"
    ),
    actionButton(
      inputId = "killitwithfire",
      label = "Reset All"
    )
      )
    )
  )
  
  magichappeningclicker <- reactiveVal(0)
  observeEvent(input$confirmdividendpayout,{
    magichappeningclicker(1)
  })
  
  observeEvent(input$killitwithfire,{
    magichappeningclicker(0)
    updateTextInput(session,"dividendpayoutpercentage",value = "")
    updateRadioButtons(session,"kindyouresearchingfor",selected  = "Make A Selection")
    updateRadioButtons(session,"exchangeyouresearchingfor",selected = "Make A Selection")
    output$dropdown <- renderUI(NULL)
  })
  
  observeEvent(input$confirmdividendpayout,{
    if(as.numeric(magichappeningclicker()) == 1){
    output$dropdown <- renderUI(
    pickerInput(
      inputId = "select",
      label = h3("Choose Your Stock"),
      #THE CHOICES NEED TO BE SPAWNED BY WHAT ALL STOCKS FIT THE DIVIDEND REQUIREMENTS....... HOW??????????????
      choices = sort(SYMBOLS$SYMBOLNAMECOMBO),
      selected = "",
      options = list(
        `live-search` = TRUE
      )
    )
  )}
    else{
      showModal(modalDialog(
        title = "You Done Goofed",
        div(
          "Eventually, I might fancify this, but for now, we'll just leave it at you did something wrong. Close this out and fix it.",
          align = "center"
        )
      ))
    }
    }
  #    names(stockInfo) <- clean_names(stockInfo)
  #   plot(stockInfo[, input$select2],
  #        from = Sys.Date() - 365,
  #        to = Sys.Date(),
  #        env = parent.frame(),
  #        src = "yahoo",
  #        auto.assign = FALSE,
  #        auto.update = FALSE,
  #        verbose = FALSE, main = paste(SYMBOLS$Name[which(SYMBOLS$SYMBOLNAMECOMBO == input$select)], " -- ", input$select2)
  #   )
  # 
  # 
  # output$realdivsgraph <-renderPlot(
  #   plot(getDividends(SYMBOLS[which(SYMBOLS$SYMBOLNAMECOMBO == input$select), 1], 
  #                     from = input$dates2[1], 
  #                     to = input$dates2[2]),
  #        from = input$dates2[1], 
  #        to = input$dates2[2],
  #        main = paste(SYMBOLS$Name[which(SYMBOLS$SYMBOLNAMECOMBO == input$select)], " -- Dividends Paid"))
  #   
  
  
  
  
  
  
  
  # ,
  # stockInfo <- c(),
  # observeEvent(input$select,{
  #   stockInfo <- getSymbols(SYMBOLS[which(SYMBOLS$SYMBOLNAMECOMBO == input$select), 1], src = "yahoo", auto.assign = FALSE, from = Sys.Date() - 365, to = Sys.Date())
  #   
  # })
  
  
  
  
  
  
  # if(as.numeric(magichappeningclicker()) == 1 & input$dividendinputbox != ""){
  # )
  )
}
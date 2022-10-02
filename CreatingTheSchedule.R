library(taskscheduleR)

myscript <- "C:/Users/daely/Documents/GitHub/Stocks/RothTracking.R"

taskscheduler_create(taskname = "TEST4 roth tracking", rscript = myscript, schedule = "DAILY", starttime = "17:15", startdate = format(Sys.Date(), "%m/%d/%Y"))

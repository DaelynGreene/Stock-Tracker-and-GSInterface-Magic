library(taskscheduleR)

myscript <- "C:/Users/daely/Documents/GitHub/Stocks/RothTracking.R"

#THE START TIME FOR THE TASKSCHEDULER IS MILITARY TIME; THERE IS NO AM PM, JUST 1-24:00

taskscheduler_create(taskname = "TEST4 roth tracking", rscript = myscript, schedule = "DAILY", starttime = "22:35", startdate = format(Sys.Date(), "%m/%d/%Y"))

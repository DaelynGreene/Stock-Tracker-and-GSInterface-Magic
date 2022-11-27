library(taskscheduleR)

myscript <- "C:/Users/daely/Documents/GitHub/Stocks/RothTracking.R"

#THE START TIME FOR THE TASKSCHEDULER IS MILITARY TIME; THERE IS NO AM PM, JUST 1-24:00

taskscheduler_create(taskname = "RothTracking", rscript = myscript, schedule = "MINUTE", startdate = format(Sys.Date(),"%d/%m/%Y"), starttime = "03:45", modifier = 15)

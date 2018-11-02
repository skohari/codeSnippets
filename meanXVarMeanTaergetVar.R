
# prereq
library(data.table)
library(formattable) # for percent formatter

df1 <- read.csv("C:\\Users\\skohari\\Downloads\\skohari_caret_app-master (16)\\skohari_caret_app-master\\Test_Data_Sets\\default_clients_2.txt", 
                   header = T, 
                   sep = '\t')

df2<- data.table(df1)
df2$Interval <- cut_number(df2$LIMIT_BAL, 10) 
setkey(df2, Interval)
df2[, 
    list(	
        countInterval = .N,
        meanXVar = mean(LIMIT_BAL), 
        meanTargetVar = percent(mean(Default))
    ), 
	by = Interval]

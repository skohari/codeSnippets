df1 <- read.csv("C:\\Users\\skohari\\Downloads\\skohari_caret_app-master (16)\\skohari_caret_app-master\\Test_Data_Sets\\default_clients_2.txt", 
                   header = T, 
                   sep = '\t')
library(grid)
library("gridExtra")


draw1 <- function(df, x, y){
  xmin <- min(df[x])
  print(xmin)
  xmax <- max(df[x])
  print(xmax)
    
  p1 <-  ggplot(df, aes_string(x, y)) + 
    stat_summary(fun.y = "mean", geom = "line") +
    scale_x_continuous(limits=c(xmin, xmax)) +
    theme_minimal() + 
    theme(axis.title.x = element_blank(), axis.text.x = element_blank())
  p2 <- ggplot(df, aes_string(x)) + 
    geom_histogram(bins = 100) + 
    scale_x_continuous(limits=c(xmin, xmax)) +
    theme_minimal()
  
  grid.newpage()
  grid.draw(rbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))
  
}
draw1(df1, 'LIMIT_BAL', 'Default')
draw1(df1, 'PAY_0', 'Default')
draw1(df1, 'PAY_2', 'Default')
draw1(df1, 'PAY_3', 'Default')


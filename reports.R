library(knitr)
library(markdown)
library(rmarkdown)

survey = read.csv('data.csv')

for (state in unique(survey$state)){
  print(paste("Compiling report for", state))
  data <- survey[ which(survey$state==state ), ]
  rmarkdown::render('template.Rmd',
                    output_file =  paste(data[1,'state'], "report", '_', Sys.Date(), ".pdf", sep=''))
}


library(knitr)
library(markdown)
library(rmarkdown)

survey = read.csv('data.csv')

#comment out line below to generate all reports
#survey <- survey[ which(survey$state=='GA' ), ]

for (state in unique(survey$state)){
  print(paste("Compiling report for", state))
  data <- survey[ which(survey$state==state ), ]
  rmarkdown::render('template.Rmd',
                    output_file =  paste(data[1,'state'], "_report", '_', Sys.Date(), ".docx", sep=''))
}


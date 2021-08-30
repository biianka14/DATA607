setwd("C:/Users/BFigueroa/OneDrive - City University of New York/SPS/DATA MANAGEMENT/Week One/hate-crimes/hate-crimes")

#Hate Crime Data can be found: https://github.com/fivethirtyeight/data/tree/master/hate-crimes #
#Article: "Higher Rates Of Hate Crimes Are Tied To Income Inequality" can be found: https://fivethirtyeight.com/features/higher-rates-of-hate-crimes-are-tied-to-income-inequality/ #

require(data.table)

hate_crimes <- fread("hate_crimes.csv", 
                    stringsAsFactors = F, 
                    data.table = F, 
                    colClasses=list(character=c(1)))

names(hate_crimes)
head(hate_crimes)
summary(hate_crimes)

#subset of dataset

crimedata2016 <- hate_crimes[,c(1:3,5:8,9:12)]

#renaming variables

names(crimedata2016)[2] <- "hhincome"
names(crimedata2016)[3] <- "pop_unemployed"
names(crimedata2016)[4] <- "pop_HSdiploma"
names(crimedata2016)[5] <- "non_citizen"
names(crimedata2016)[6] <- "white_poverty"
names(crimedata2016)[7] <- "non_white"
names(crimedata2016)[8] <- "voted_trump"
names(crimedata2016)[9] <- "GINI_Index"
names(crimedata2016)[10] <- "hatecrimes<2015"
names(crimedata2016)[11] <- "hatecrimes=2016"

# Graph

State_graph <- crimedata2016[,c(1,9:11)]
data2015 <- crimedata2016[,c(1,9,10)]
data2016 <- crimedata2016[,c(1,9,11)]

summary(State_graph)

require(ggplot2)

ggplot(data = State_graph) +
  geom_bar(mapping = aes(x = GINI_Index))


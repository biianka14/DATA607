### Assignment 3
## Please deliver links to an R Markdown file (in GitHub and rpubs.com) with solutions 
## to the problems below.  You may work in a small group, but please submit separately 
## with names of all group participants in your submission.

# 1. Using the 173 majors listed in fivethirtyeight.com's College Majors dataset 
# [https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/], 
# provide code that identifies the majors that contain either "DATA" or "STATISTICS"

require(tidyverse)
require(ggrepel)
require(stringr)

college_majors <- read.csv(url("https://raw.githubusercontent.com/fivethirtyeight/data/master/college-majors/majors-list.csv"))

data_majors = subset(college_majors, grepl("DATA|STATISTICS", Major))
data_majors

# 2 Write code that transforms the data below:

# [1] "bell pepper"  "bilberry"     "blackberry"   "blood orange"

# [5] "blueberry"    "cantaloupe"   "chili pepper" "cloudberry"  

# [9] "elderberry"   "lime"         "lychee"       "mulberry"    

# [13] "olive"        "salal berry"

# Into a format like this:

# c("bell pepper", "bilberry", "blackberry", "blood orange", "blueberry", "cantaloupe", 
# "chili pepper", "cloudberry", "elderberry", "lime", "lychee", "mulberry", "olive", 
# "salal berry")

fruits_data1 <- c("bell pepper", "bilberry", "blackberry", "blood orange")
fruits_data2 <- c("blueberry", "cantaloupe", "chili pepper", "cloudberry")
fruits_data3 <- c("elderberry", "lime", "lychee", "mulberry")
fruits_data4 <- c("olive", "salal berry")
fruits_data <- c(fruits_data1,fruits_data2,fruits_data3,fruits_data4)
fruits_data

#3 Describe, in words, what these expressions will match:

"(.)\1\1"

## The expression above is missing a second backlash (\), therefore there won't be any match.
## The correct expression should have two backlash (\\). See example below:

## Example1:

example1 <- c("caaat", "dooog", "bird")
writeLines(example1)

str_view(example1, "(.)\1\1", match = TRUE)

# One backlash (\) shows nothing

str_view(example1, "(.)\\1\\1", match = TRUE)

# Two backlash (\\) shows the words with three matching characters

"(.)(.)\\2\\1"

## The expression above, will show the same two characters followed by the same two characters in reverse. 

## Example2:

example2 <- c("follow, hollow, sink, bed")
writeLines(example2)

str_view_all(example2, "(.)(.)\\2\\1", match = TRUE)

"(..)\1"

## The expression above is also missing a second backlash (\), so it will show nothing.
## The correct expression shouls have two backlash (\\). See example below:

## Example3:

example3 <- c("banana", "pear", "papaya")
writeLines(example3)

str_view_all(example3, "(..)\1", match = TRUE)

# One backlash (\) shows nothing

str_view_all(example3, "(..)\\1", match = TRUE)

# Two backlash (\\) shows the characters that are repeated.

"(.).\\1.\\1"

## The expression above, shows that the third and fifth character match the first character, 
## while the second and fourth can be any character. See example below:

## Example4

example4 <- c("banana", "Kosovo", "monkey")
writeLines(example4)

str_view_all(example4, "(.).\\1.\\1", match = TRUE)

"(.)(.)(.).*\\3\\2\\1"

## The expression above is a little similar to the previous expression. It will look 
## for the three same characters with a number of characters in between in reverse order.
## See example below:

## Example5

example5 <- c("lolololo", "bananana", "apple")
writeLines(example5)

str_view_all(example5, "(.)(.)(.).*\\3\\2\\1", match = TRUE)

#4 Construct regular expressions to match words that:

## Start and end with the same character.

data1 <- c("mom", "dad", "sons", "daughter")
writeLines(data1)

str_view_all(data1, "^(.).*\\1$", match = TRUE)

## Contain a repeated pair of letters (e.g. "church" contains "ch" repeated twice.)

data2 <- c("church", "banana", "apple")
writeLines(data2)

str_view_all(data2, "(..).*\\1", match = TRUE)

## Contain one letter repeated in at least three places (e.g. "eleven" contains three "e"s.)

data3 <- c("eleven", "banana", "Kosovo", "dog")
writeLines(data3)

str_view_all(data3, "(.).\\1.\\1", match = TRUE)

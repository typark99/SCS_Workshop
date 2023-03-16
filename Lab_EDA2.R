#####################################################################
# File: Lab_EDA2.R
# Author: Taeyong Park 
# Summary: EDA for two variables
#####################################################################

rm(list=ls()) # remove existing data and variables in the Environment.

dataYoutube = read.csv("YouTube.csv")

# VARIABLES
# name:	Name of the YouTube channel
# category:	User-defined channel topic
# country:	The country of origin of the channel
# accountAge:	The age of the account in weeks. Note that for consistency the age calculation was performed on December 31 2018.
# videoUploads:	The amount of videos uploaded by the channel.
# subscribers:	The number of subscribers to the channel
# views:	The total views across all videos
# viewsPerVideo:	Total views divided by videos
# continent:	Continent of origin of the channel
# id: identification number

# obtain a summary of the dataset
summary(dataYoutube)

# Review: summary of one variable
table(dataYoutube$category)
table(dataYoutube$country)
summary(dataYoutube$subscribers)
which.max(dataYoutube$subscribers)
# Pull out the name of the channel with the highest number of subscribers 
dataYoutube$name[1022]
# Alternatively, you can do
dataYoutube$name[dataYoutube$subscribers==max(dataYoutube$subscribers)]


#####################################################################
#
# Relationship between two quantitative variables
#
#####################################################################
# subscribers - views
hist(dataYoutube$views,
     ylim=c(0,1200),
     xlab="Number of Views",
     main="Histogram: Channel's Total Views",
     col="turquoise") 
hist(dataYoutube$subscribers,
     ylim=c(0,800),
     xlab="Number of Subscribers",
     main="Histogram: Channel's Subscribers",
     col="turquoise") 

hist(log(dataYoutube$views),
     ylim=c(0,500),
     xlab="Number of Views \n (Natural Log-Transformed)",
     main="Histogram: Channel's Total Views",
     col="gold") 
hist(log(dataYoutube$subscribers),
     ylim=c(0,300),
     xlab="Number of Subscribers \n (Natural Log-Transformed)",
     main="Histogram: Channel's Subscribers",
     col="gold") 

# scatterplot: plot(X axis, y axis)
plot(log(dataYoutube$subscribers), log(dataYoutube$views), 
     xlab="Number of Subscribers \n (Natural Log-Transformed)",
     ylab="Number of Views (Natural Log-Transformed)", 
     main="Scatterplot of YouTube Data",
     pch=9, col="violetred")

# covariance
cov(dataYoutube$subscribers, dataYoutube$views)
cov(10*dataYoutube$subscribers, 10*dataYoutube$views)

# correlation coefficient 
cor(dataYoutube$subscribers, dataYoutube$views)
cor(10*dataYoutube$subscribers, 10*dataYoutube$views)


#####################################################################
#
# Relationship between qualitative-quantitative variables
#
#####################################################################
#  Variables
#  Course:Course that the Respondent was enrolled in
#  Math: Math SAT Score
#  Verbal:Verbal SAT Score
#  HT:Respondent's Height (in inches)
#  Shoe:Shoe Size (US)
#  Gender:Respondent's Gender
#  MomHT:Height of Respondent's Mother (in inches)
#  DadHT:Height of Respondent's Father (in inches)
#  Color:Favorite Color
#  WT:Respondent's Weight (in pounds)
#  Major:Declared Major

dataStat = read.csv("IntroStatisticsSurvey.csv")

summary(dataStat)

barplot(table(dataStat$Gender), 
        ylim=c(0,2000),
        ylab="Frequency",
        xlab="Gender",
        main="Statistics Survey Data",
        col=c("violetred", "skyblue"))
hist(dataStat$Verbal, xlab="Verbal SAT Score",
     main="Statistics Survey Data", 
     col="wheat")

boxplot(Verbal~Gender, data=dataStat,
        xlab="Gender",
        ylab="Verbal SAT Score",
        main="Statistics Survey Data",
        col=c("violetred", "skyblue"))

mean(dataStat$Verbal[dataStat$Gender=="female"])
mean(dataStat$Verbal[dataStat$Gender=="male"])
sd(dataStat$Verbal[dataStat$Gender=="female"])
sd(dataStat$Verbal[dataStat$Gender=="male"])

#####################################################################
#
# Relationship between two qualitative variables
#
#####################################################################
# bar chart for the Course variable
barplot(table(dataStat$Course),
        ylab="Frequency",
        xlab="Course",
        main="Statistics Survey Data",
        col=c("orchid", "peachpuff", "palegreen"))

# contingency table
contingency=table(dataStat$Gender, dataStat$Course)
round(proportions(contingency[,1]), 3)
round(proportions(contingency[,2]), 3)
round(proportions(contingency[,3]), 3)

# stacked bar chart
barplot(contingency, 
        xlab="Course", ylab="Number of Students",
        main="Statistics Survey Data", 
        col=c("violetred", "skyblue"))
legend(bty="n", "topright", 
       legend = rev(rownames(contingency)), # rev=reverse
       pch=15, col=rev(c("violetred", "skyblue")), 
       cex = 1.2)

# side-by-side bar chart
barplot(contingency, 
        xlab="Course", ylab="Number of Students",
        main="Statistics Survey Data", 
        col=c("violetred", "skyblue"),
        beside=TRUE,
        ylim=c(0,1000))
legend(bty="n", "topright", 
       legend = rev(rownames(contingency)), # rev=reverse
       pch=15, col=rev(c("violetred", "skyblue")), 
       cex = 1.2)


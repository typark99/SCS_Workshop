################################
# File: SCS_BasicTests.R
# Author: Taeyong Park 
################################

##################################################
# 
# Comparing two population means 
#
##################################################

dataStat = read.csv("IntroStatisticsSurvey.csv")

# Do females and males have different verbal SAT scores?    

#####################################
# Define two groups
#####################################
sample_f = dataStat[dataStat$Gender=="female", 3] 
# "3" indicates the Verbal variable on the third column 
sample_m = dataStat[dataStat$Gender=="male", 3]

#####################################
# t.test function
#####################################
# By default, 0.05 sig level; 95% confidence level.
t.test(sample_f, sample_m)
# 0.01 sig level; 99% confidence level.
t.test(sample_f, sample_m, conf.level = .99)

#####################################
# Exercise
#####################################
# Do the students taking Business Stats and 
# the student taking Stats for Science have
# different SAT Math scores at 0.05 level?


##################################################
# 
# Comparing three or more population means 
#
##################################################
# Do students taking different stat courses have
# different SAT Math scores at 0.05 level?

#####################################
# aov function for anova
#####################################
# Use the aov function to run an Anova model.
# in the aov function, the model must be "dependentV ~ independentV"
anova_stat = aov(Math ~ Course, data=dataStat)
summary(anova_stat)

#####################################
# Exercise
#####################################
# 1. Does the height of student's father differ 
# for student's preferred color at 0.05 level?

# Generate another question that can be answered
# by the anova method.
# And test your question at 0.05.


########################################################
# 
# Independence test for two or more qualitative variables 
#
########################################################

# Do females and males tend to take different stat courses?
# If Yes, gender and course are not independent.
# If No, they are independent of each other. 

# First, create a contingency table.
contingency = table(dataStat$Course, dataStat$Gender)

#####################################
# chisq.test function
#####################################
chisq.test(contingency, correct=F)
# The correct argument is for the Yates continuity correction for small samples.
# It must be FALSE for large samples (n>10).


#####################################
# Exercise
#####################################
# Generate a question that can be answered by 
# the test of independence. 
# And test your question at 0.01.


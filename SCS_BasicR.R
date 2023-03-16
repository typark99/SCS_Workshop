#####################################################################
# File: SCS_Basics.R
# Author: Taeyong Park 
#####################################################################


### FOUR WINDOWS IN RStudio
# Editor: you type R code.
# Console: the output of your code is displayed.
# In the two other windows, you can see plots, a history of your commands, etc.


### BASIC ARITHMETIC 
# Write something here and find the solution in the console. 

# To send a line of code to your console, 
# place your cursor on the line, and then press 
# (PC users:) "control + enter"
# (Mac users:) "command + return"
# Alternatively, click the Run icon. 
# You can also simply copy and paste the line of code. 

1+3
1+4

2 + 3  #addition 

##### BTW, What is the pound key (#) for?
# R doesn't read anything after #
# You can write explanations using it.


2*3  # multiplication
5/3 #division
4-5 #subtraction
3^3 # exponentiation
exp(7) # exponential
log(10) # natural log
sqrt(100) # square root



### ASSIGNMENT OF VALUES 
# One important concept as you are programming is the notion of a variable.  
# The "<-" and "=" symbols are used to assign a value to a variable.

# Create a and b that take on the values of 78 and 8.
a <- 78
b = 8 
# Print the values.
print(a)
print(b)
# or simply
a
b
a; b


y <- 5
x <- 2*(y + 11)
y; x

addXY = x+y
addXandYorwhateveryouwant <- x + y
addXY
addXandYorwhateveryouwant

# You can override previous code by assigning alternative values.
y = 3
x = (y-8) + 7
y; x
addXandY = x + y



#########################
# Exercise 
#########################
# Create A that takes the value of 3 and create B that is a function indicating two times of A.

# Create a function multiplying A by B, and name the function "multiAB".

# Print "multiAB".

# Create a function adding log(A) and B squared, and name the function "addAB".

# Print "addAB".

# Create a function adding C and D, and name the function "addCD".



########################################################
# DATA STRUCTURES: vectors and dataframes
########################################################


##############
# VECTORS    #
##############

# Vectors are one-dimensional and allow you to store data.  
# You create vectors in R using the combine function, c().  
# You place the vector elements separated by a comma between the brackets. 

numeric_vector = c(1,2,3,4,5)
numeric_vector
character_vector = c("a", "b", "c", "d")
character_vector

many_numeric_vector = c(1:100)
many_numeric_vector

#################################################
## EXERCISE 
# Create a vector of your first name and last name, 
# and name it myname_vector.
# Hint: your vector should have two elements.
#################################################


# You want to be attentive to the kind of data you are handling, 
# particularly if the data is stored as text or as numeric values.  

class(numeric_vector)
class(character_vector)
class(myname_vector)

# You can also add two numeric vectors together.  Let's see how that works.

vector_one = c(1,2,3)
vector_two = c(4,5,6)
vector_sum = vector_one + vector_two

# Other calculations
vector_mean = (vector_one + vector_two)/2
vector_div = vector_one / vector_two


# Now pull out one element from a vector.  
# We'll pull out the first element and the third element of vector_sum.

vector_sum[1]
vector_sum[3]
vector_sum[c(1,2)]



## EXERCISE  ####################################
# Pull out your last name from the myname_vector.
#################################################



##############
# DATAFRAMES #
##############

########################################################
##### Set up the working directory
########################################################


## The most common thing we want to do in R is working with data of some sort.
## Usually these data are in some format like .csv (excel spreadsheets),
## .dta (Stata dataset), or .txt (text files).

## Reading these into R (i.e. adding them to your workspace) is very simple,
## but it first requires telling R where they are on your computer.

## We do this by setting our working directory, which is the folder in which
## the files are stored. If you try to load data into R which is not inside
## the folder specified in your working directory, you'll get an error.
## Also, anytime you export anything from R (new datasets, graphs, etc.) it will
## save them to your working directory.


# 1. Create a new directory (a new folder) for this course; You will save
# every data file into this folder in this semester.
# 2. Download the files from Canvas and save them to the new folder you just created.
# 3. In the menu bar at RStudio, click Session 
# 4. Place the cussor on Set Working Directory and click Choose Directory.
# 5. Then choose the new directory to which you saved the files.
# 6. Double-check if your working directory is your desired folder using
getwd()


#########################
# Exercise 
#########################
# Download SoftDrink.csv and save it to the directory you want to use for this course.
# Follow the instruction above to set up your working directory.

# Run
list.files()

# See if SoftDrink.csv appears in the console window.


########################################################
##### Loading data into R
########################################################

data.soft = read.csv("SoftDrink.csv")


####################################
# 1. Qualitative data
####################################

## Now let's dive into the data.soft

## Let's take a look the Brand.Purchased variable closely.

# Type of data
class(data.soft$Brand.Purchased) # By putting "$", you can call variables.
class(data.soft) # Without "$VARIABLE", you call data.

# What categories?
table(data.soft$Brand.Purchased)
# table() function builds a frequency table of the counts at each combination of factor levels.

# mean, median?
mean(data.soft$Brand.Purchased)
median(data.soft$Brand.Purchased)


## Delve into further the data structure
dim(data.soft) # dimension: 50 rows and 1 column

# You can call a specific row or column
data.soft[,1]
data.soft[2,]

# You can call a specific observation
data.soft[4,1]
data.soft$Brand.Purchased[4]
# You can identify which row numbers have "Dr. Pepper"
which(data.soft$Brand.Purchased=="Dr. Pepper")


### Let's plot the data

############
# Bar plot
############
barplot(data.soft$Brand.Purchased)
# Read the error message. How will you fix it?

# You want the frequency of each category.
table(data.soft$Brand.Purchased)
barplot(table(data.soft$Brand.Purchased))

# You can explore further.

# First of all, you may want to expand the y-axis.
barplot(table(data.soft$Brand.Purchased), ylim=c(0,20))
# Color the bars.
barplot(table(data.soft$Brand.Purchased), ylim=c(0,20), 
        col="blue")
# Even more colors.
colors()
barplot(table(data.soft$Brand.Purchased), ylim=c(0,20), 
        col="salmon")
barplot(table(data.soft$Brand.Purchased), ylim=c(0,20), 
        col="darkred")
# Finally, labels and title.
barplot(table(data.soft$Brand.Purchased), 
        ylim=c(0,20), col="darkred", 
        xlab="Soft Drink", ylab="Frequency",
        main="Soft Drink Purchases")



####################################
# 2. Quantitative data
####################################

data.audit = read.csv("Audit.csv")

# Variable names?
colnames(data.audit)
# Type of data (variable)?
class(data.audit$Audit.Time)

# "numeric" and "integer" indicate that the variable is quantitative.

### Summarize with numerical measures.
# Location measures
mean(data.audit$Audit.Time)
median(data.audit$Audit.Time)
quantile(data.audit$Audit.Time)

# Variability measures
sd(data.audit$Audit.Time)
var(data.audit$Audit.Time)
range(data.audit$Audit.Time)


# You can draw a histogram to summarize the data graphically. 
# Generally, googling is recommended to find an R function for a specific task.  
# Google "histogram in r." 

# To obtain details about a function, use ? or help().
?hist
help(hist)

hist(data.audit) # Error because data.audit is a data frame not a vector.
# The first argument must be a vector of values.
hist(data.audit$Audit.Time) 

# Customize labels, title, colors, ect.
hist(data.audit$Audit.Time, xlab="Audit Time (Days)", 
     main="Histogram for the Audit Time Data",
     col = "mediumaquamarine")

hist(data.audit$Audit.Time, xlab="Audit Time (Days)", 
     main="Histogram for the Audit Time Data",
     col = "tomato2")

# A boxplot function is also available.
boxplot(data.audit$Audit.Time)

boxplot(data.audit$Audit.Time,
        main="Box Plot for the Audit Time Data",
        ylab="Days",
        col = "royalblue")

boxplot(data.audit$Audit.Time,
        main="Box Plot for \n the Audit Time Data",
        ylab="Days",
        col = "royalblue")

####################################
# Export plots
####################################
# Plots panel –> Export –> Save as Image or Save as PDF.

setwd("~/Project")
data <- read.csv("~/Project/AdultData_orig.csv")
str(data)

data[[ "age"]] <- ordered(cut(data[[ "age"]], c(15,35,65,100)),
                          labels = c("Young", "Middle-aged", "Senior"))

data[[ "hours_per_week"]] <- ordered(cut(data[[ "hours_per_week"]],
                                         c(0,30,40,168)),
                                     labels = c("Part-time", "Full-time", "Over-time"))

data[[ "capital_gain"]] <- ordered(cut(data[[ "capital_gain"]],
                                       c(-Inf,0,median(data[[ "capital_gain"]][data[[ "capital_gain"]]>0]),
                                         Inf)), labels = c("None", "Low", "High"))

data[[ "capital_loss"]] <- ordered(cut(data[[ "capital_loss"]],
                                       c(-Inf,0, median(data[[ "capital_loss"]][data[[ "capital_loss"]]>0]),
                                         Inf)), labels = c("None", "Low", "High"))

data$work_class = as.character(data$work_class)
data$occupation = as.character(data$occupation)
data$native_country = as.character(data$native_country)
data$education = as.character(data$education)
data$race = as.character(data$race)
data$marital_status = as.character(data$marital_status)

data$work_class = gsub("^Federal-gov","Govt",data$work_class)
data$work_class = gsub("^Local-gov","Govt",data$work_class)
data$work_class = gsub("^State-gov","Govt",data$work_class)
data$work_class = gsub("^Private","Private",data$work_class)
data$work_class = gsub("^Self-emp-inc","Self-Employed",data$work_class)
data$work_class = gsub("^Self-emp-not-inc","Self-Employed",data$work_class)
data$work_class = gsub("^Without-pay","Not-Working",data$work_class)
data$work_class = gsub("^Never-worked","Not-Working",data$work_class)

data$occupation = gsub("^Adm-clerical","Admin",data$occupation)
data$occupation = gsub("^Armed-Forces","Military",data$occupation)
data$occupation = gsub("^Craft-repair","Laborer",data$occupation)
data$occupation = gsub("^Exec-managerial","Executive",data$occupation)
data$occupation = gsub("^Farming-fishing","Laborer",data$occupation)
data$occupation = gsub("^Handlers-cleaners","Laborer",data$occupation)
data$occupation = gsub("^Machine-op-inspct","Laborer",data$occupation)
data$occupation = gsub("^Other-service","Service",data$occupation)
data$occupation = gsub("^Priv-house-serv","Service",data$occupation)
data$occupation = gsub("^Prof-specialty","Professional",data$occupation)
data$occupation = gsub("^Protective-serv","Other-Occupations",data$occupation)
data$occupation = gsub("^Sales","Sales",data$occupation)
data$occupation = gsub("^Tech-support","Other-Occupations",data$occupation)
data$occupation = gsub("^Transport-moving","Laborer",data$occupation)


data$education = gsub("^10th","Dropout",data$education)
data$education = gsub("^11th","Dropout",data$education)
data$education = gsub("^12th","Dropout",data$education)
data$education = gsub("^1st-4th","Dropout",data$education)
data$education = gsub("^5th-6th","Dropout",data$education)
data$education = gsub("^7th-8th","Dropout",data$education)
data$education = gsub("^9th","Dropout",data$education)
data$education = gsub("^Assoc-acdm","Associates",data$education)
data$education = gsub("^Assoc-voc","Associates",data$education)
data$education = gsub("^Bachelors","Bachelors",data$education)
data$education = gsub("^Doctorate","Doctorate",data$education)
data$education = gsub("^HS-Grad","HS-Graduate",data$education)
data$education = gsub("^Masters","Masters",data$education)
data$education = gsub("^Preschool","Dropout",data$education)
data$education = gsub("^Prof-school","Prof-School",data$education)
data$education = gsub("^Some-college","HS-Graduate",data$education)

data$marital_status[data$marital_status=="Never-married"] = "Not-Married"
data$marital_status[data$marital_status=="Married-AF-spouse"] = "Married"
data$marital_status[data$marital_status=="Married-civ-spouse"] = "Married"
data$marital_status[data$marital_status=="Married-spouse-absent"] = "Not-Married"
data$marital_status[data$marital_status=="Separated"] = "Not-Married"
data$marital_status[data$marital_status=="Divorced"] = "Not-Married"
data$marital_status[data$marital_status=="Widowed"] = "Not-Married"

data$race[data$race=="White"] = "White"
data$race[data$race=="Black"] = "Black"
data$race[data$race=="Amer-Indian-Eskimo"] = "Amer-Indian"
data$race[data$race=="Asian-Pac-Islander"] = "Asian"
data$race[data$race=="Other"] = "Other"

data = na.omit(data)

data$marital_status = factor(data$marital_status)
data$education = factor(data$education)
data$native_country = factor(data$native_country)
data$work_class = factor(data$work_class)
data$occupation = factor(data$occupation)
data$race = factor(data$race)
data$gender = factor(data$gender)
data$relationship = factor(data$relationship)
data$income = as.factor(ifelse(data$income==data$income[1],0,1))

data$education_numeric <- NULL
data$fnlwgt <- NULL

View(data)
dim(data)

write.csv(data, file = "AdultR.csv")




#Set work directory
if(grepl("Jace", getwd())){
    setwd("D:/Jace/Project/98.Learning/Kaggle_azazon_m5/kernel/RVersion")
}else{
    cd("C:\\Users\\CCYoTzom\\Desktop\\kaggle_azazon_m5\\kernel")
}

#library
library(stringr)

#combine multi part data
#Status : Finished
loadMultiData <- function(filepath, filepattern){
    if(filepath == "")stop("filepath is empty!")
    data <- data.frame()
    filepattern <- ifelse(grepl(".csv", filepattern), str_match(filepattern, "([[:alnum:][:punct:]]*).csv"), filepattern)
    filename_list <- list.files(filepath, pattern = paste0(ifelse(filepattern == "", "", "^"), filepattern, "[[:alnum:][:punct:]]*.csv$"))
    if(length(filename_list) > 0){
        cat("符合條件的csv檔: ", filename_list, "\n")
        for (i in 1:length(filename_list)) {
            data <- rbind(data, read.csv(paste0(filepath, "/", filename_list[i]), header = F, sep = ",", stringsAsFactors = F))
        }
    }else{
        cat("沒有符合條件的csv檔\n")
    }
}

#read data
calendar=CSV.read("../data/calendar.csv")
sales_train_validation=CSV.read("../data/sales_train_validation.csv")
sample_submission=CSV.read("../data/sample_submission.csv")
sell_prices=CSV.read("../data/sell_prices.csv")

#known data

# Goal: Estimate the unit sales of Walmart retail goods.
# 
# calendar.csv - Contains information about the dates on which the products are sold.
# sales_train_validation.csv - Contains the historical daily unit sales data per product and store [d_1 - d_1913]
# sample_submission.csv - The correct format for submissions. Reference the Evaluation tab for more info.
# sell_prices.csv - Contains information about the price of the products sold per store and date.
# sales_train_evaluation.csv - Available once month before competition deadline. Will include sales [d_1 - d_1941]


println("rows length: ", size(df, 1), ", columns length: ", size(df, 2))

#Todo: EDA

#Todo: data preproccesing
#Todo: machine learning
#Todo: predict
#Todo: cross validation
#Todo: Artificial Neural Network
#Todo: training and tuning model
#Todo: export data
#Todo: dashboard
#Todo: API

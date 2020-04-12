#Set work directory
if(grepl("Jace", getwd())){
    setwd("D:/Jace/Project/98.Learning/Kaggle_azazon_m5/kernel/RVersion")
}else{
    setwd("C:/Users/CCYoTzom/Desktop/Work/kaggle_azazon_m5/kernel/RVersion")
}

#library
library(stringr)
#library(tidyverse)
library(vroom) # use vroom() load csv

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

#load data
calendar <- data.frame(vroom("../../data/calendar.csv"))
sales_train_validation <- data.frame(vroom("../../data/sales_train_validation.csv"))
#sample_submission <- data.frame(vroom("../../data/sample_submission.csv"))
sell_prices <- data.frame(vroom("../../data/sell_prices.csv"))

#known data
# Goal: Estimate the unit sales of Walmart retail goods.
# 
# calendar.csv - Contains information about the dates on which the products are sold.
#   - wm_yr_wk : 每星期唯一的ID(每年共52周從1/29日起)
#   - snap_(CA.TX.WI) : 是否開放補充營養援助計劃的人購買
#   - all column names : date、wm_yr_wk、weekday、wday、month、year、d、event_name_1
#                       event_type_1、event_name_2、event_type_2、snap_CA、snap_TX、snap_WI
# sell_prices.csv - Contains information about the price of the products sold per store and date.
#   - sell_price : 單個商品每周每間店的售價
#   - all column names : store_id、item_id、wm_yr_wk、sell_price
# sample_submission.csv - The correct format for submissions. Reference the Evaluation tab for more info.
# sales_train_validation.csv - Contains the historical daily unit sales data per product and store [d_1 - d_1913]
#   - all column names : id、item_id、dept_id、cat_id、store_id、state_id、d_1、d_2
# sales_train_evaluation.csv - Available once month before competition deadline. Will include sales [d_1 - d_1941]
#   - 每個商品在每間店的銷售數量

cat("rows length: ", nrow(sales_train_validation), ", columns length: ", ncol(sales_train_validation))

#direction:
#1.計算出節日前後影響消費區間 : 依日期groupby每日總賣出的產品數量，畫出曲線看是否可以訂出影響消費的區間


###Todo: Data preproccesing

#trans sales
days_colNames <- names(sales_train_validation)[grepl("d_[0-9]*", names(sales_train_validation))]
sales <- data.frame()
for (colName in days_colNames) {
  sales <- rbind(sales, cbind(sales_train_validation[, colName], colName))
}

#combine data unused
#full_df <- merge(x = , y = df2, by = "CustomerId", all = TRUE)

###Todo: EDA
###Todo: Feature engineering
###Todo: Machine learning
###Todo: Predict
###Todo: Cross validation
###Todo: Artificial Neural Network
###Todo: training and tuning model
###Todo: export data
###Todo: dashboard
###Todo: API

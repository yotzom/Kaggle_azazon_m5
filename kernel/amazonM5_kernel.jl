#homedir()
#pwd()
#Set work directory
cd("C:\\Users\\CCYoTzom\\Desktop\\kaggle_azazon_m5\\kernel")
#cd("D:\\Jace\\Project\\98.Learning\\Kaggle_azazon_m5\\kernel")

using CSV
using DataFrames

#Finished
#search string in array
"""
    searchArray(array, pattern)

documentation
"""
function searchArray(array, pattern)
    pattern = Regex(pattern)
    tmp = Vector()
    for i in array
        if occursin(pattern, i)
            push!(tmp, i)
        end # if
    end # for
    return tmp
end # function

#finished
#combine mutil part data
"""
    loadMultiData(filepath, filename, sort)

    Example:
        data = loadMultiData("..\\data\\", "calendar")
documentation
"""
function loadMultiData(filepath, filepattern, sort = true)
    #list all file in current folder
    filelist = searchArray(readdir(filepath, sort = sort), filepattern)
    data = DataFrame()
    for i in filelist
        data = [data; CSV.read(string(filepath, i))]
        println(string("load data : ", i, " success."))
    end
    println("load data finished.")
    return data
end # function



#read data
calendar=CSV.read("../data/calendar.csv")
sales_train_validation=CSV.read("../data/sales_train_validation.csv")
sample_submission=CSV.read("../data/sample_submission.csv")
sell_prices=CSV.read("../data/sell_prices.csv")

#known data
"""
goal: Estimate the unit sales of Walmart retail goods.
calendar.csv - Contains information about the dates on which the products are sold.
sales_train_validation.csv - Contains the historical daily unit sales data per product and store [d_1 - d_1913]
sample_submission.csv - The correct format for submissions. Reference the Evaluation tab for more info.
sell_prices.csv - Contains information about the price of the products sold per store and date.
sales_train_evaluation.csv - Available once month before competition deadline. Will include sales [d_1 - d_1941]
"""

println("rows length: ", size(df, 1), ", columns length: ", size(df, 2))

#Todo: EDA
using Plots
x = 1:10; y = rand(10); # These are the plotting data
plot(x, y)
#Todo: data preproceesing
#Todo: machine learning
#Todo: predict
#Todo: cross validation
#Todo: Artificial Neural Network
#Todo: training and tuning model
#Todo: export data
#Todo: dashboard
#Todo: API

#homedir()
#pwd()
#Set work directory
#cd("C:\\Users\\CCYoTzom\\Desktop\\kaggle_azazon_m5\\kernel")
cd("D:\\Jace\\Project\\98.Learning\\Kaggle_azazon_m5\\kernel")

using CSV
using DataFrames

#untest
#combine mutil part data
"""
    loadMultiData(filepath, filename, sort)

documentation
"""
function loadMultiData(filepath, filename, sort = true)
    #list all file in current folder
    filelist = readdir(filepath, sort = sort)
    data = DataFrame()
    for i in filelist
        global data = [data; CSV.read(string(filepath, i))]
        println(string("load data : ", i, " success."))
    end
    println("load data finished.")
    return data
end # function

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

#read data
calendar=CSV.read("../data/calendar.csv")
sales_train_validation=CSV.read("../data/sales_train_validation.csv")
sample_submission=CSV.read("../data/sample_submission.csv")
sell_prices=CSV.read("../data/sell_prices.csv")

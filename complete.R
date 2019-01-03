library(stringr)

complete <- function(directory = "specdata", id = 1:3)
{
    finalDataFrame = data.frame(id = numeric(), nobs = numeric())
    for(i in id)
    {
        datatable = data.frame()

        filename = paste(directory, "\\", str_pad(i, 3, pad="0"), ".csv", sep = "")
        ##print(paste("Reading file: ", filename))
        
        datatable = read.csv(filename)
        ##print(paste("    Dataframe read, total rows:", nrow(datatable)))
        
        datatable = datatable[complete.cases(datatable), ]
        ##print(paste("    Na removed, new total rows:", nrow(datatable)))
        
        finalDataFrame = rbind(finalDataFrame, data.frame(id = i, nobs = nrow(datatable)))
    }
    finalDataFrame
}
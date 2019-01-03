library(stringr)

pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332)
{
    datatable = data.frame()
    for(i in id)
    {
        filename = paste(directory, "\\", str_pad(i, 3, pad="0"), ".csv", sep = "")
        ##print(paste("Reading file: ", filename))
        
        datatable = rbind(datatable, read.csv(filename))
        ##print(paste("Dataframe appended, total rows:", nrow(datatable)))
    }
    mymean = mean(datatable[[pollutant]], na.rm = T)
    ##print(paste("Mean of ", pollutant, ": ", mymean))
    mymean
}
library(stringr)

corr <- function(directory = "specdata", threshold = 0)
{
    crVector = vector('numeric')
    
    for(i in 1:332)
    {
        datatable = data.frame()
        
        filename = paste(directory, "\\", str_pad(i, 3, pad="0"), ".csv", sep = "")
        ##print(paste("Reading file: ", filename))
        
        datatable = read.csv(filename)
        ##print(paste("    Dataframe read, total rows:", nrow(datatable)))
        
        datatable = datatable[complete.cases(datatable), ]
        ##print(paste("    Na removed, new total rows:", nrow(datatable)))
        
        if(nrow(datatable) > threshold)
        {
            keeperTable = subset(datatable, select = c(sulfate,nitrate))
            ##print(head(keeperTable))
            cr = cor(keeperTable)
            ##print(cr)
            ##print(cr[[1,2]])
            crVector = c(crVector, cr[[1,2]])
        }
    }
    crVector
}
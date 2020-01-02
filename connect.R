connect_mysql <- function(){
  ## How to connect to MySQL and show all Databases
  ucscDb <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
  result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);
  
  ## Get all Tables from Specific DB
  hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
  allTables <- dbListTables(hg19)
  
  ## how many tables the DB has
  lenght(allTables)
  
  ## show first 5 tables
  allTables[1:5]
  
  ## show all the fields for a given table
  dbListFields(hg19, "affyU133Plus2")
  
  ## show how many rows a tables has
  dbGetQuery(hg19, "select count(*) from affyU133Plus2")
  
  ## Read data from table
  affyData <- dbReadTable(hg19, "affyU133Plus2")
  head(affyData)
  
  ## Get Specific Subset
  query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
  affyMis <- fetch(query);quantile(affyMis$misMatches)
}
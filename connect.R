connect_mysql <- function(){
  ucscDb <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
  result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);
}
##r2d2 function (beep beep boop)

#chopper refers to a dataframe (csv) at least the following columns
  # X (upper-case)
  # goby : or sample indentifier
  # point : number assigned to a landmark
  # pointL :letter/name assigned to a landmark/ point and pointL must correspond with each individual
  # x (lower-case) : x coordinate
  # y (lower-case) : y coordinate
#lando is a list of the landmarks pairs that you are interested in getting the distances from


library(raster)
library(dplyr)
library(glue)
library(purrr)


r2d2 <- function(chopper,lando){
  c3po_1 <- chopper[chopper$pointL==lando[1],] %>% 
    dplyr::select(x,y) %>% 
    as.matrix()
  
  c3po_2 <- chopper[chopper$pointL==lando[2],] %>% 
    dplyr::select(x,y) %>% 
    as.matrix() 
  
  pointDistance(c3po_1,c3po_2, lonlat = FALSE)
  
}

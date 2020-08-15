##Open File##

bdpal <- read_excel(file.choose())
bdpala <- bdpal

#Create Lookup Table#
lookup <- bdpal[,c("Alias", "Stock Level")]
#Rename Alias in Lookup Table to Match Desired outcome variable 
names(lookup)[names(lookup)=="Alias"] <- "Reports to Email"
#merge lookup table and original table on desired outcome variable (My Manager's Alias)
bdpal2 <- merge(lookup, bdpal, by = "Reports to Email", all = TRUE)
#Rename New Column from Merged Set
names(bdpal2)[names(bdpal2)=="Stock Level.x"] <- "Manager Level"

##This line removes a bunch of duplicates from the merge. 
bdpal2<- bdpal2[-which(is.na(bdpal2$Alias)), ]

bdpal2$"Manager EE Level Delta" <- bdpal2$"Manager Level" - bdpal2$"Stock Level"
bdpala <- bdpal2

#########################################################################
##Do The Above for WHI##
#########################################################################

lookup <- bdpal[,c("Alias", "WHI")]
#Rename Alias in Lookup Table to Match Desired outcome variable 
names(lookup)[names(lookup)=="Alias"] <- "Reports To Level 2"
#merge lookup table and original table on desired outcome variable (My Manager's Alias)
bdpal3 <- merge(lookup, bdpala, by = "Reports To Level 2", all = TRUE)
names(bdpal3)[names(bdpal3)=="WHI.x"] <- "L2 WHI"

lookupb <- bdpal3[,c("Alias", "L2 WHI")]

bdpala <- merge(bdpal3, lookupb, by ="Alias", all = TRUE)
bdpala<- bdpala[-which(is.na(bdpala$Alias)), ]

#########################################################################
##Do The Above for LEI##
#########################################################################

lookup <- bdpal[,c("Alias", "LEI")]
#Rename Alias in Lookup Table to Match Desired outcome variable 
names(lookup)[names(lookup)=="Alias"] <- "Reports To Level 1"
#merge lookup table and original table on desired outcome variable (My Manager's Alias)
bdpal3 <- merge(lookup, bdpala, by = "Reports To Level 1", all = TRUE)
names(bdpal3)[names(bdpal3)=="LEI.x"] <- "L1 LEI"

lookupb <- bdpal3[,c("Alias", "L1 LEI")]

bdpala <- merge(bdpal3, lookupb, by ="Alias", all = TRUE)
bdpala<- bdpala[-which(is.na(bdpala$Alias)), ]

#########################################################################
##Clean Up##
#########################################################################
names(bdpala)[names(bdpala)=="L1 LEI.x"] <- "L1 LEI"
names(bdpala)[names(bdpala)=="L2 WHI.x"] <- "L2 WHI"
names(bdpala)[names(bdpala)=="LEI.y"] <- "LEI"
names(bdpala)[names(bdpala)=="WHI.y"] <- "WHI"
bdpala$"L2 WHI.y" <- NULL
bdpala$"L1 LEI.y" <- NULL

write.csv(bdpala, "pal.csv")

#########################################################################
##Stat Work##
#########################################################################


cor(na.exclude(bdpala[,c("Length In Level", "Stock Level.y", "Manager EE Level Delta", "L2 WHI", "Months at MS")]))

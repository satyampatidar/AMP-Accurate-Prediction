setwd("C://Users//satyampatidar//desktop//think//AMP")
amp <- read.table("QC_File_Depomed_AMP_v2.txt",sep = "\t",header = TRUE)
colnames(amp)[1] <- "Provider_ID"

unique_providers <- data.frame(unique(amp$Provider_ID))
length(unique(amp$Provider_ID))
targeted_providers <- amp[which(amp$isTargeted == 'Y' | amp$Year_Month != 'NULL'),]
length(unique(targeted_providers$Provider_ID))

temp <- amp[which(amp$isTargeted == 'Y' & amp$Year_Month != 'NULL'),]
length(unique(temp$Provider_ID))
subs <- subset(amp, !is.na(Year_Month))

library("reshape")
test_reshape <- melt(temp, id = c("Year_Month"))
library("plyr")
test_amp <- arrange(temp, desc(Year_Month, Provider_ID))
attach(temp)
test_amp <- temp[order(Provider_ID),]
test_amp1 <- temp[order(Year_Month,-Provider_ID),]
detach(test_amp)
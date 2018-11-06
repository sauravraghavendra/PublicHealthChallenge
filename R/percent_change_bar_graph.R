install.packages("dplyr")
library(dplyr)

updateddata <- opioid_deaths_15_16 <- opioid_deaths_15_16 %>%
  group_by(State) %>%
  mutate(Diff = Crude.Rate - lag(Crude.Rate))

updateddata <- na.omit(opioid_deaths_15_16)

print(updateddata)


counts <- updateddata$Diff
xaxis <- updateddata$State

barplot(counts,  ylim = c(-5, 20), names.arg = xaxis, pos = -.2, main = "Change in Opioid Deaths 2015-2016",
        ylab = "Difference in Crude Rate", col = "red", las=3)


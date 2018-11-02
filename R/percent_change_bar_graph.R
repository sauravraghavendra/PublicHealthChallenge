install.packages("dplyr")
library(dplyr)

newdata <- opioid_deaths_15_16 %>%
  group_by(State) %>%
  mutate(Diff = Crude.Rate - lag(Crude.Rate))

print(newdata)

counts <- newdata$Diff

barplot(counts, names.arg = newdata$State, main = "Change in Opioid Deaths 2015-2016", xlab = "State", ylab = "Difference in Crude Rate", col = "magenta")

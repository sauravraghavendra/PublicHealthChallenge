install.packages("ggplot2")
install.packages("usmap")
install.packages("dplyr")
install.packages("ggmap")
install.packages(c("maps", "mapdata"))

library(ggmap)
library(mapdata)
library(usmap)
library(ggplot2)
library(dplyr)

year <- opioid_2015_2016$Year

newdata <- opioid_2015_2016[opioid_2015_2016$Year<2016,]
print(newdata)

usa <- map_data("usa")
states <- map_data("state")
#plot_usmap(data = opioid_2015_2016, values = opioid_2015_2016$`Crude Rate`, lines = "red") + 
#  scale_fill_continuous(name = "Population (2015)", label = scales::comma) + 
  #theme(legend.position = "right")

#plot_usmap(include = newdata$State, data = newdata, values = newdata$`Crude Rate`)
#plot_usmap(include = newdata$State, data = newdata, values = newdata$'Crude Rate', lines = "orange")

ggplot(data = states) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + geom_polygon(data = newdata, aes(fill = 'Crude Rate'), color = "white") 
  coord_fixed(1.3) +
  guides(fill=FALSE)
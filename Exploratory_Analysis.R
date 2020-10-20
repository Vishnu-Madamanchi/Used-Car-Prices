#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("plotly")
library(ggplot2)
library(dplyr)
library(plotly)
df <- read.csv("cars.csv",na.strings=c("NA",""))
str(df)
summary(df)
#EXPLORATORY ANALYSIS

#Top 10 Manufacturers with highest re-sale value
df1 <- df %>%
  group_by(manufacturer_name) %>%
  summarise(total_price = mean(price_usd)) %>%
  arrange(desc(total_price)) %>%
  top_n(10)

View(df1)
#Density plot of Odometer_value column
 plt <- ggplot(df, aes(x=odometer_value)) + 
        geom_histogram(aes(y=..density..),colour="green", fill="yellow")+
        geom_density(alpha=.4, fill="blue")
 ggplotly(plt)
#Histogram plot of odometer_value column
plot1 <- ggplot(data=df, aes(manufacturer_name)) + 
         geom_histogram( col="red",aes(fill=..count..),bins = 50,stat = "count") +
         scale_fill_gradient("Number Of Cars", low="green", high="red") +
         labs(title="Distribution of Odometer values",x="Manufacturer Name", y = "Number of Cars")
  
ggplotly(plot1)

#Histogram plot for year_produced vs Number of cars 
plot2 <- ggplot(data=df, aes(year_produced)) + 
         geom_histogram(col="red", aes(fill=..count..),bins=50) +
         scale_fill_gradient("Number of Cars", low="green", high="red") +
         labs(title="Year Produced vs No of Cars",x="Year Produced", y = "Number of Cars") 
  
ggplotly(plot2)

#Histogram plot for price_usd column
plot3 <- ggplot(df, aes(x=price_usd)) + 
         geom_histogram(colour="green", fill="black",bins = 50)+
         geom_density(alpha=.2, fill="green") +
         labs(title="Price Distribution",x="Price", y = "NUmber of cars") 
  
ggplotly(plot3)

#Boxplot of Engine_type vs Price_usd  
plot4 <- ggplot(df, aes(x=engine_type, y=price_usd, fill=engine_type)) + 
         geom_boxplot()+
         labs(title="Price of different engine types",x="Engine Type", y = "Price") +
         theme_classic()

ggplotly(plot4)

#Boxplot of Transmission column
plot5 <- ggplot(df, aes(x=transmission, y=price_usd, fill=transmission)) + 
         geom_boxplot()+
         labs(title="Price of different Transmission types",x="Transmission", y = "Price") +
         theme_classic()

ggplotly(plot5)

#Boxplots of color column

df2 <- df %>%
  group_by(color) %>%
  summarise(total_price = mean(price_usd)) %>%
  arrange(desc(total_price)) %>%
  top_n(10)

View(df2)
plot6 <- ggplot(df, aes(x=color, y=price_usd, fill=color)) + 
         geom_boxplot()+
         labs(title="Price of different colors",x="color", y = "Price") +
         theme_classic()

ggplotly(plot6)
  
#Boxplot of engine_fuel column
plot7 <- ggplot(df, aes(x=engine_fuel, y=price_usd, fill=engine_fuel)) + 
         geom_boxplot() +
         labs(title="Price of different engine fuels",x="Engine Fuel", y = "Price") +
         theme_classic()

ggplotly(plot7)

#Boxplot of body_type column
plot8 <- ggplot(df, aes(x=body_type, y=price_usd, fill=body_type)) + 
         geom_boxplot()+
         labs(title="Price of different Body Types",x="Body Type", y = "Price") +
         theme_classic()

ggplotly(plot8)

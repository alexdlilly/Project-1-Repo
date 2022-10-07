library(tidyverse)
library(MASS)

diamonds <- read.csv("diamonds.csv", header=TRUE)
diamonds$color <- factor(diamonds$color, levels = c("J", "I", "H", "G", "F", "E", "D"))
diamonds$clarity <- factor(diamonds$clarity, levels = c("SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF", "FL"))
diamonds$cut <- factor(diamonds$cut, levels = c("Good", "Very Good", "Ideal", "Astor Ideal"))


#1 variable
ggplot(diamonds, aes(y = price))+
  geom_boxplot()

ggplot(diamonds, aes(y = carat))+
  geom_boxplot()

ggplot(diamonds, aes(x = color))+
  geom_bar()

ggplot(diamonds, aes(x = clarity))+
  geom_bar()

ggplot(diamonds, aes(x = cut))+
  geom_bar()

# 2 variable
#ggplot(diamonds, aes(x = carat, y = price))+
  #geom_point()

#ggplot(diamonds, aes(x = color, y = price))+
  #geom_boxplot()


#ggplot(diamonds, aes(x = clarity, y = price))+
  #geom_boxplot()

#ggplot(diamonds, aes(x = cut, y = price))+
  #geom_boxplot()

ggplot(diamonds, aes(x = color, y = carat))+
  geom_boxplot()

ggplot(diamonds, aes(x = cut, y = carat))+
  geom_boxplot()

ggplot(diamonds, aes(x = clarity, y = carat))+
  geom_boxplot()

ggplot(diamonds, aes(x = clarity, fill = color))+
  geom_bar()

ggplot(diamonds, aes(x = color, fill = cut))+
  geom_bar()

ggplot(diamonds, aes(x = clarity, fill = cut))+
  geom_bar()

# 3 variables
ggplot(diamonds, aes(x = carat, y = price, color = color))+
  geom_point()

ggplot(diamonds, aes(x = carat, y = price, color = clarity))+
  geom_point(alpha = 0.7)

# interesting would expect cut to be highest price at a given carat but does not
# appear to be the case, looks like maybe color is more important based on both plots
ggplot(diamonds, aes(x = carat, y = price, fill = cut))+
  geom_point(shape = 21, alpha = 0.5)

ggplot(diamonds, aes(x = color, y = price, fill = clarity))+
  geom_boxplot()

ggplot(diamonds, aes(x = clarity, y = carat, fill = cut))+
  geom_boxplot()

ggplot(diamonds, aes(x = clarity, y = price, fill = cut))+
  geom_boxplot()

ggplot(diamonds, aes(x = clarity, y = carat, fill = color))+
  geom_boxplot()

ggplot(diamonds, aes(x = cut, y = carat, fill = color))+
  geom_boxplot()

ggplot(diamonds, aes(x = clarity, fill = color))+
  geom_bar()+
  facet_wrap(~cut)

# 4 variables
ggplot(diamonds, aes(x = carat, y = price, fill = color, size = clarity))+
  geom_point(shape = 21, alpha = 0.7)

ggplot(diamonds, aes(x = carat, y = price, fill = color, size = cut))+
  geom_point(shape = 21, alpha = 0.7)

ggplot(diamonds, aes(x = carat, y = price, fill = clarity, size = cut))+
  geom_point(shape = 21, alpha = 0.7)

#Transform Variables
summary(diamonds$clarity)
newC.levels <- c("SI/VS", "SI/VS", "SI/VS", "SI/VS", "VVS2", "VVS1", "IF", "FL")
clarity2 <- factor(newC.levels[diamonds$clarity])
diamonds$clarity2 <- factor(diamonds$clarity2, levels = c("SI/VS", "VVS2", "VVS1", "IF", "FL"))
diamonds <- data.frame(diamonds,clarity2)
ggplot(diamonds, aes(x = clarity2))+
  geom_bar(fill = "blue")+
  labs(x = "Clarity", y = "Count", title="Clarity Counts")

quartiles(diamonds$carat)

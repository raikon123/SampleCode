#clear the memory
rm (list = ls())

library(ggplot2)
wds <- read.csv("C:/Users/njohnson1/Documents/WDS2012.csv")
head(wds)

wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = area, fill = tfrGT2))
p + geom_bar()

# plot the bar graph based on the area and le >75

#generate a new variable
wds$leGT75 <- wds$le > 75
p <- ggplot(data = wds, aes(x = area, fill = leGT75))
#p + geom_bar()
p + geom_bar(position = 'dodge', width =0.5)

# 
p <- ggplot(data = wds, aes(x = le, y = tfr))
p + geom_point()
#add some noises, seperate the data points
p <- ggplot(data = wds, aes(x = le, y = tfr))
p + geom_point(position = 'jitter') # equivalent to 
#another solution
p <- ggplot(data = wds, aes(x = le, y = tfr))
p + geom_jitter()

#plot the jitter graph of leM again le which is x-axis
#jitter plots by adding some noises to the data
p <- ggplot(data = wds, aes(x = le, y = leM))
p + geom_jitter()

# plot the original points
p <- ggplot(data = wds, aes(x = le, y = leM))
p + geom_point()
p + geom_bar() + coord_flip()

#transpancy controled by alpha, if alpha =0, we can
# Not see the graph, if alpha=1, we could see it.
p <- ggplot(data = wds, aes(x = le, y = tfr))
p + geom_point(size = 3, alpha = 0.3)

# coordiantes

p <- ggplot(data = wds, aes(x = factor(1), fill = area))
p + geom_bar()

#generate a bar plot by region
p <- ggplot(data = wds, aes(x = factor(1), fill = region))
p + geom_bar()

# plot the original points
p <- ggplot(data = wds, aes(x = factor(1), fill = area))
p + geom_bar() + coord_flip()

# polar coordinate: The angle is propotional to the number of records
# in the corresponding area
p <- ggplot(data = wds, aes(x = factor(1), fill = area))
p + geom_bar() + coord_polar(theta = 'y')

#draw a polor plot based on region
p <- ggplot(data = wds, aes(x = factor(1), fill = region))
p + geom_bar() + coord_polar(theta = 'y')
#clockwise direction if direction = -1, couterclose wise direction if
#direction= 1
p <- ggplot(data = wds, aes(x = factor(1), fill = area))
p + geom_bar() + coord_polar(theta = 'y', direction = -1)

#clear the memory
rm (list = ls())

library(ggplot2)
wds <- read.csv("C:/Users/njohnson1/Documents/WDS2012.csv")
head(wds)

#graph imr again le for each categroy in area
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_jitter()
p + facet_grid(. ~ area)

# graph imr again le for each catogory in region
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_jitter()
p + facet_grid(. ~ region)

#graph imr again le for each categroy in area but turn graph horizonta
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_jitter()
p + facet_grid(area ~ .)

#graph imr again le for each categroy in region but turn graph horizonta
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_jitter()
p + facet_grid(region ~.)

#turns into matrix (facet-grid (area ~ tfrGT2))
wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_jitter()
p + facet_grid(area ~ tfrGT2)

#add trend line and points for imr against le based on area and tfrGT2 combination
wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_point()+geom_smooth(method = 'lm', se = FALSE)
p + facet_grid(area ~ tfrGT2)

#switch (x ~ y) for line 24-27
wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_jitter()
p + facet_grid(tfrGT2 ~ area)

#switch the (x ~ y) for line 29-32
wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_point()+geom_smooth(method = 'lm', se = FALSE)
p + facet_grid(tfrGT2 ~ area)

#
wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = le, y = imr)) + geom_jitter()
p + facet_grid(tfrGT2 ~ area, margins = TRUE)

# graph tfr again imr based on area and tfrGT2 with marginal plots
wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = imr, y = tfr)) + geom_jitter()
p + facet_grid( tfrGT2~ area, margins = TRUE)

#add trend line
wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = imr, y = tfr)) + geom_jitter()+geom_smooth(method = 'lm', se = TRUE)
p + facet_grid( tfrGT2~ area, margins = TRUE)

#save graphs to file
ggsave('le_tfr1.pdf')
ggsave('le_tfr2.jpeg')

#get working diretory
getwd()

#add trend line
wds$tfrGT2 <- wds$tfr > 2
p <- ggplot(data = wds, aes(x = imr, y = tfr)) + geom_jitter()+geom_smooth(method = 'lm', se = TRUE) + ggtitle("Life Expectancy and TFR") + xlab("infant mortality rate (years)") + ylab("total fertility rate (tfr)")

p + facet_grid( tfrGT2~ area, margins = TRUE)
#save graphs to file
ggsave('le_tfr1.pdf')
ggsave('le_tfr2.jpeg')
#get working diretory
getwd()




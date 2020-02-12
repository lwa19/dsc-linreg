# Testing DSC linreg

#####################################################
# Installation (run once)
# install.packages("devtools")
# install.packages("glmnet")
# install.packages("ggplot2")
# install.packages("cowplot")

# library(devtools)
# install_github("stephenslab/susieR")
# install_github("pcarbo/varbvs",subdir = "varbvs-R")
# install_github("stephenslab/dsc",subdir = "dscrutils")
#####################################################

# Run DSC:
# commands: dsc -c 2 linreg.dsc --> replicate = 20

library(dscrutils)
library(ggplot2)
library(cowplot)
source("code/plots.R")


methods <- c("ridge","lasso","elastic_net","susie","varbvs","varbvsmix")
dsc <- dscquery("dsc/linreg",c("simulate","fit", "mse.err"), 
                "simulate.scenario", verbose = FALSE)
head(dsc)
dim(dsc)

dsc <- dsc[c("DSC","simulate","simulate.scenario","fit","mse.err")]
dsc <- transform(dsc,
                 simulate = factor(simulate),
                 fit      = factor(fit,methods))
names(dsc)[1] <- "seed"
nrow(dsc)

# summarize results:
rmse <- compute.relative.mse(dsc)
dsc  <- cbind(dsc,rmse)

# visualization
p1 <- rmse.boxplot(subset(dsc,simulate == "null_effects"),"null")
p2 <- rmse.boxplot(subset(dsc,simulate == "one_effect"),"one effect")
p3 <- rmse.boxplot(subset(dsc,simulate.scenario == 1),"scenario 1")
p4 <- rmse.boxplot(subset(dsc,simulate.scenario == 2),"scenario 2")
p5 <- rmse.boxplot(subset(dsc,simulate.scenario == 3),"scenario 3")
p6 <- rmse.boxplot(subset(dsc,simulate.scenario == 4),"scenario 4")
p  <- plot_grid(p1,p2,p3,p4,p5,p6)
print(p)

## The above implementation exactly replicates the process and results shown below:
# https://stephenslab.github.io/dsc-linreg/results_overview.html

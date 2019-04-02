# DSC for evaluating linear regression methods

A DSC for evaluating prediction accuracy of linear regression methods
in different scenarios.

## Instructions for use

First, install [DSC][dsc].

Next, install [R][R], and the R packages used in the DSC, and in the
analyses of the DSC results. The devtools and glmnet packages can be
installed from CRAN:

```R
install.packages("devtools")
install.packages("glmnet")
install.packages("ggplot2")
install.packages("cowplot")
```

The susieR, varbvs and dscrutils packages can be installed from GitHub
using [devtools][devtools]:

```R
library(devtools)
install_github("stephenslab/susieR")
install_github("pcarbo/varbvs",subdir = "varbvs-R")
install_github("stephenslab/dsc",subdir = "dscrutils")
```

Clone or download this git repository.

Now you should have everything you need to run the DSC. Navigate to
the "dsc" directory inside your local copy of the git repository, and
run it with this command (here we have chosen 4 threads, but you may
want to adjust the number of threads to better suit your computer):

```bash
dsc -c 4 linreg.dsc
```

Go grab a coffee while you wait for the DSC to run. It may take some
time, perhaps as long as 10 to 20 minutes, for all the DSC pipelines
to complete.

Once the DSC has finished running, you may work through
[this short analysis](https://stephenslab.github.io/dsc-linreg/index.html)
to explore the results of the DSC in R or RStudio. When running the R
code, make sure your working directory is set to the "analysis"
directory in the git repository.

*DSC is designed to be easily extended*—please make improvements to
this DSC by modifying our experiments, or by adding new methods,
scenarios or evaluation metrics as you see fit.

[dsc]: https://github.com/stephenslab/dsc
[R]: www.r-project.org
[devtools]: https://github.com/r-lib/devtools

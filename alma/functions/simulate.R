# This file contains functions that simulate data sets to evaluate
# methods for linear regression. Currently, all the data simulations
# borrow ideas from Alma (2011), "BLAHBLAHBLAH", Journal of the Royal Statistical
# Society, Series B, 67(2): 301–320. FIX JOURNAL + TITLE

# ARE THERE EVEN TRAINING VS TEST IN THIS?!

# generate a matrix of explanatory variables from N(0,1) distr.
generate_independent_normal <- function(n, p) {
  M <- matrix( rnorm(n*p,mean=0,sd=1), n, p)
  return(M)
}

# Returns outcomes y simulated from a linear regression model, y = X*b
# + e, in which the residuals e are i.i.d. normally with zero mean and
# standard deviation se > 0. Input X should be an n x p numeric
# matrix, where n is the number of simulated samples and p is the
# number of simulated predictors.
# (This was from the original linreg/.../simulate.R)
# (THIS MIGHT NOT BE NEEDED AFTERALL)
simulate_efficiency_data <- function (X, b) {
  n <- nrow(X)
  X.matrix <- cbind(rep(1, n), X)
  Y.top <- X.matrix %*% b
  Y.bottom <- rnorm(100, 100, 1) + 100
  Y <- rbind(Y.top, Y.bottom)
  return(drop(Y))
}

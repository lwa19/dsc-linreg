# This R script implements the "XXXX" module in the linreg DSC.
# it replicates the "efficiency" test in Alma 2011 (4.1)
n     <- 1000   # yi
p     <- 2      #? Since there's only X1 and X2? so num X's?
b     <- c(rep(5, p+1), 0.5)   # didn't they mention 30 somewhere WHERE DID THAT COME FROM? EH?
X     <- generate_independent_normal(900, e)  # 900 x (X1, X2, e)
y     <- simulate_efficiency_data(X, b)   # the output is a 1xn array (dropped from nx1 matrix output)





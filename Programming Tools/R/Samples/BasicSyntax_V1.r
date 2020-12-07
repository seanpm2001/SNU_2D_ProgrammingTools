> x <- 1:6  # Create vector.
> y <- x^2  # Create vector by formula.
> print(y)  # Print the vector’s contents.
[1]  1  4  9 16 25 36

> mean(y)  # Arithmetic mean of vector.
[1] 15.16667

> var(y)  # Sample variance of vector.
[1] 178.9667

> model <- lm(y ~ x)  # Linear regression model y = A + B * x.
> print(model)  # Print the model’s results.

Call:
lm(formula = y ~ x)

Coefficients:
(Intercept)            x 
     -9.333        7.000

> summary(model)  # Display an in-depth summary of the model.

Call:
lm(formula = y ~ x)

Residuals:
      1       2       3       4       5       6
 3.3333 -0.6667 -2.6667 -2.6667 -0.6667  3.3333

Coefficients:
            Estimate Std. Error t value Pr(>|t|)   
(Intercept)  -9.3333     2.8441  -3.282 0.030453 * 
x             7.0000     0.7303   9.585 0.000662 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.055 on 4 degrees of freedom
Multiple R-squared:  0.9583, Adjusted R-squared:  0.9478
F-statistic: 91.88 on 1 and 4 DF,  p-value: 0.000662

> par(mfrow = c(2, 2))  # Create a 2 by 2 layout for figures.
> plot(model)  # Output diagnostic plots of the model.

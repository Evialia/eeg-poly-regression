function [modelStats, residuals] = evaluateModel(InputData, outputData)
% Task 2.1 - Estimate model parameters
theta = estimateModelParamteters(InputData, outputData);

% Task 2.2 - Compute model residual (error) sum of squared errors (RSS)
predictedY = predictY(InputData, theta);
residuals = outputData - predictedY;
rss  = calculateRSS(residuals);

% Task 2.3 - Compute the log-likelihood function
n = height(InputData);
logLikelihood = calculateLogLikelyhood(rss, n);

% Task 2.4 - Compute the Akaike information criterion (AIC) and Bayesian information criterion (BIC)
k = height(theta);
aic = 2 * k - 2 * logLikelihood;
bic = k * log(n) - 2 * logLikelihood;

modelStats = table(rss, logLikelihood, aic, bic);
end
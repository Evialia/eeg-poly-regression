function [ci] = calculateMarginOfError(data)
% for 95% confidence interval
ci = 1.960 * std(data)/sqrt(length(data));
end


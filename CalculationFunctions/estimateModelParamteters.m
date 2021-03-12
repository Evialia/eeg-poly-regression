function [theta] = estimateModelParamteters(X, y)
    theta = pinv(X' * X) * X' * y;
end
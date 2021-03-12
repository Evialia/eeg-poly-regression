function [logLikelihood] = calculateLogLikelyhood(rss, n)
    sigmaSqrd = rss / (n - 1);
    logLikelihood = (-n/2 * log(2*pi)) - (-n/2 * log(sigmaSqrd)) - (1 / 2 * sigmaSqrd * rss);
end
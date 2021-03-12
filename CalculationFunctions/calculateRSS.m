function [rss] = calculateRSS(err)
    rss = sum(err.^2); 
end

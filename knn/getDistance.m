function [values, idx] = getDistance(x, y, p)
    [values, idx] = sort (sum ( abs( (x(:,1:end-1) - y(ones(size(x,1),1), :) ) .^p), 2) .^ (1 / p));
end

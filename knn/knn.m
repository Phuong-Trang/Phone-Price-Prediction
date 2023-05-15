function [classified, k, dist, idx] = knn(data, input, k, distance)

    if (nargin <= 3)
        % Minkowski Distance
        % for p == 2, Minkowski becomes equal Euclidean
        % for p == 1, Minkowski becomes equal city block metric
        % for p ~= 1 && p ~= 2 -> Minkowski
        distance = 2;
    end

    % trained data has one more column as unknown, the class
    [dist, idx] = getDistance(data, input, distance);

    if (nargin <= 2)
        % determine k value when no one is given
        % possible number of categories + 1
        k = numel( unique( data(:,end) ) ) + 1;
    end

    classified  = mode(data(idx(1:k), end));
end

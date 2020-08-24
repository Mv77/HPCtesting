function [res] = test_fun(size)

    % Create a size x size matrix
    mat = normrnd(0,1,[size,size]);
    % Get the inverse
    inverse = inv(mat*mat');
    % And sum all of its elemenst
    res = sum(inverse,'all');
    
end

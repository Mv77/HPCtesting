function [res] = test_fun(size)

% Create a random size x size matrix
mat = normrnd(0,1,[size,size]);
% Get the inverse of its 'square'
inverse = inv(mat*mat');
% And sum all of its elements
res = sum(inverse,'all');

end

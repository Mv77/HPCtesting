% Parameters determining complexity of the test

% Size of a matrix that will be inverted.
size = 200;
% Number of times the operation will be performed.
n = 500;

%% Parallel

% Print number of cores
feature('numcores')
% Assign them them to a variable
ncores = feature('numcores');

% Create a pool of workers with all the available cores.
pool = parpool(ncores);

% Call our test function n times in parallel and time it.
tic
parfor i=1:n
    test_fun(size);
end
t = toc;

% Shut down the parallel pool
delete(pool);
disp(['Parallel time was ',num2str(t),' seconds']);

%% Sequential
% Repeat the same task sequentially
tic
for i=1:n
    test_fun(size);
end
t = toc;
disp(['Sequential time was ',num2str(t),' seconds']);

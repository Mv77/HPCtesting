n = 500;
size = 200;

%% Parallel

% Print number of cores
feature('numcores')
% Assign them
ncores = feature('numcores');

pool = parpool(ncores);
tic
parfor i=1:n
    test_fun(size);
end
t = toc;
delete(pool);
disp(['Parallel time was ',num2str(t),' seconds']);

%% Sequential
tic
for i=1:n
    test_fun(size);
end
t = toc;
disp(['Sequential time was ',num2str(t),' seconds']);

library(parallel)


test_func <- function(size){
  
  mat <- matrix(1:(size^2), nrow = size)/size^2
  mat <- mat %*% t(mat)
  mat <- solve(mat)
  return(sum(mat))
  
}

n <- 50
size <- 2

# Sequential
############
start <- Sys.time()
res <- lapply(X = 1:n, FUN = function(x) test_func(size))
print(paste('Sequential time was',
            Sys.time()-start))

# Parallel
##########

cores <- detectCores()
print(paste('There are',cores,'threads available'))

start <- Sys.time()
# Create pool
pool <- makeCluster(cores)
# Export func
clusterExport(pool,c("test_func","size"))
# Apply the function n times in parallel
res <- parLapply(cl = pool, X= 1:n, fun = function(x) test_func(size))
# Terminate cluster
stopCluster(pool)
print(paste('Parallel time was',
            Sys.time()-start))
library(parallel)


test_func <- function(size){
  
  mat <- matrix(rnorm(size^2), nrow = size)
  mat <- mat %*% t(mat)
  mat <- solve(mat)
  return(sum(mat))
  
}

n <- 500
size <- 200

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

# Sequential
############
start <- Sys.time()
res <- lapply(X = 1:n, FUN = function(x) test_func(size))
print(paste('Sequential time was',
            Sys.time()-start))
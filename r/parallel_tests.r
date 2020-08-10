library(parallel)


test_func <- function(size){
  
  mat <- matrix(1:(size^2), nrow = size)/size^2
  mat <- solve(mat %*% t(mat))
  return(sum(mat))
  
}

test_func(4)

n <- 50
size <- 10

# Parallel
##########

cores <- detectCores()
print(paste('There are',cores,'threads available'))

start <- Sys.time()
# Create pool
pool <- makeCluster(cores)
# Apply the function n times in parallel
res <- parLapply(cl = pool, x= 1:n, fun = test_func)
# Terminate cluster
stopCluster(pool)
print(paste('Parallel time was',
            Sys.time()-start))

# Sequential
############
start <- Sys.time()
res <- lapply(x = 1:n, fun = test_func)
print(paste('Sequential time was',
            Sys.time()-start))
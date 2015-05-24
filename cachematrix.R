## makeCacheMatrix is a function that returns a list of functions
## Its puspose is to store a martix and a cached value of the inverse of the 
# matrix

##createCacheMatix

makeCacheMatrix <- function(x = matrix()) {
 cache <- NULL
  setMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
}

  # return the stored matrix
  getMatrix <- function() {
    x
  }
  
  # cache inverse
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  # get cached value
  getInverse <- function() {
    cache
  }
  
  # return a list. Each named is a function
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


# Cal the inverse of matrix created with makeCacheMatrix
cacheSolve <- function(y, ...) {
 
  inverse <- y$getInverse()  # get the cached value
  
  # return cached value
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  # cal the inverse and store
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  inverse
}

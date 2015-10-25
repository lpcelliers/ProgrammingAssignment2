## Provided functions allow for the caching the computation of the inverse of a matrix

## Creates a special matrix, which containins a function to
## * set the value of the matrix
## * set the value of the matrix
## * set the value of the inverse of the Matrix
## * get the value of the inverse of the Matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setcacheSolve <- function(cacheSolve) m <<- cacheSolve
  getcacheSolve <- function() m
  matrix(set = set, get = get,
       setcacheSolve = setcacheSolve,
       getcacheSolve = getcacheSolve)
}


## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
  m <- x$getcacheSolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- cacheSolve(data, ...)
  x$setcacheSolve(m)
  m
}

## Put comments here that give an overall description of what your
## functions do

## Make an object with four function to set and retrieve a matrix, and to set and retrieve its inverse

makeCacheMatrix <- function(x = matrix()) {
     i <- NULL
     set <- function(y) {
          x <<- y
          i <<- NULL
     }
     get <- function() x
     setinverse <- function(inverse) i <<- inverse
     getinverse <- function() i
     list(set = set, get = get,
          setinverse = setinverse,
          getinverse = getinverse)
}


## cacheSolve function returns inverse of the matrix and sets the value in cache variable. 
## If the same compution is repeated without changing the data, inverse matrix is straightaway returned from cached variable

cacheSolve <- function(x, ...) {
       i <- x$getinverse()
     if(!is.null(i)) {
          message("getting cached data")
          return(i)
     }
     data <- x$get()
     i <- solve(data,...)
     x$setinverse(i)
     i
}

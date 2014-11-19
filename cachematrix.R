## Put comments here that give an overall description of what your
## functions do

##
# Create an object containing getters and setters for
# a matrix and its inverse. Updating the value of the matrix
# will NULL the value of the inverse.
##
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  setMatrix <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  getMatrix <- function() {
    x
  }
  setInverse <- function(inverse) {
    i <<- inverse
  }
  getInverse <- function() {
    i
  }
  list(setMatrix=setMatrix, getMatrix=getMatrix, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

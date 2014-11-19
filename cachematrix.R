# Functions to calculate and cache the inverse of a square matrix. cacheSolve
# replaces solve {base}, and takes the output of makeCacheMatrix as it's first
# argument instead of a raw matrix. makeCacheMatrix wraps a raw matrix and 
# provides access to the original matrix and the inverse matrix if it has been
# set.

makeCacheMatrix <- function(m = matrix()) {
  # Create an object containing getters and setters for
  # a matrix and its inverse. Updating the value of the matrix
  # will NULL the value of the inverse.
  #
  # Args:
  #   m: the matrix that will inverted
  #
  # Returns:
  #   An object with the functions getMatrix and setMatrix to manipulate
  #   the input matrix, and getInverse and setInverse to maniplate the
  #   inverse matrix cache

  i <- NULL
  setMatrix <- function(y) {
    m <<- y
    inverse <<- NULL
  }
  getMatrix <- function() {
    m
  }
  setInverse <- function(inverse) {
    i <<- inverse
  }
  getInverse <- function() {
    i
  }
  list(setMatrix=setMatrix, getMatrix=getMatrix, setInverse=setInverse, getInverse=getInverse)
}


cacheSolve <- function(x, ...) {
  # Returns the inverse of the cache matrix in x. If the inverse has not
  # previously been calculated it will insert the inverse into x, otherwise
  # it will use the cached value.
  #
  # This assumes x contains a square matrix and uses solve {base}
  # package to produce the inverse.
  #
  # Args:
  #   x: the cache matrix as produced by makeCacheMatrix
  #   ...: the argmuments to be passed to the inner solve function
  # Returns:
  #  the inverse of x
  i <- x$getInverse()
  if(!is.null(i)) {
    return(i)
  }
  matrix <- x$getMatrix()
  i <- solve(matrix, ...)
  x$setInverse(i)
  i
}

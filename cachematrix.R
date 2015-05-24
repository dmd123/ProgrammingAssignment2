## The functions below calculate the inverse of the a matrix (cacheSolve),
## and utilizes a cache function to avoid unnecesary recalculations (makeCacheMatrix)

makeCacheMatrix <- function(x = matrix()) {
## This function produces a list of the 3 functions below
## It starts by initializing N to null
        m <- NULL
## This function preserves the original matrix
        get <- function() {
                x
        }
## This function preserves the inverse via a superassignment to m
        setinverse <- function(inverse) {
                m <<- inverse
        }
## This function preserves the inverse
        getinverse <- function() {
                m
        }
        list (get = get, setinverse= setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
## Check to see if cache has value, which would occur if m is not null
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
## These commands are used if cache is empty and inverse needs to be caculated
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}

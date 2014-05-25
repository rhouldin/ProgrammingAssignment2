## Constructor method and calculation method that implement a caching
## mechanism for a matrix and its inverse.

## Create a CacheMatrix object for the supplied matrix.
## The CacheMatrix object wraps a matrix with get and set operations,
## for the matrix and its inverse.  Caching the inverse allows needless
## repetitions of the expensive inversion operation to be avoided.
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) m <<- inverse
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Return the inverse of the supplied cacheMatrix object.
## If the inverse has been calculated and cached, then the calculation is
## skipped and the cached value is returned.
## Otherwise, the inverse is calculated, cached, and returned.
cacheSolve <- function(x, ...) {
    ## Check whether there is a cached copy of the inverse.
    m <- x$getInverse()
    if(!is.null(m)) {
        # A cached copy was found; use it.
        message("getting cached data")
    } else {
        ## Otherwise, compute the inverse and cache it.
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
    }

    # Return the inverse.
    m
}

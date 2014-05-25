# CacheMatrix

## Description

The CacheMatrix object wraps a matrix with get and set operations,
for the matrix and its inverse.  Caching the inverse allows needless
repetitions of the expensive inversion operation to be avoided.

makeCacheMatrix constructs a CacheMatrix object from a matrix.

cacheSolve returns the inverse of the matrix from the CacheMatrix object,
using the cached version if available.

## Usage

```
makeCacheMatrix(x)
cacheSolve(c, ...)
```

## Arguments

```
x   matrix
c   CacheMatrix object
```

## Examples

```
a <- matrix(runif(16),ncol=4)
ai <- cacheSolve(a)
```

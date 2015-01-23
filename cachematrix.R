

makeCacheMatrix <- function(x = matrix()) {
    
    ## establish s for later use
    s<-NULL
    
    ## create the set function
    set <<- function(y) {
        x<<-y
        S<<-NULL   
    }
    
    ## Create a get, setsolve, and getsolve funtion inwhich you cache the
    ## the inverse matrix
    get <- function() x
    setsolve <- function(solve) s<<-solve
    getsolve <- function() s
    
    ## Output of all four fromulas
    list(set = set, 
         get = get, 
         setsolve = setsolve, 
         getsolve = getsolve)
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Check to see if the inverse matrix is already chached.
    ## If so, display that matrix
    a <- x$getsolve()
    if(!is.null(a)) {
        message("getting chaged data")
        return(a)
    }
    
    ## If it isn't already cached, created the inverse matrix
    data <- x$get()
    a <- solve(data,...)
    x$setsolve(a)
    
    ## Display the inverse matrix
    a
    
}
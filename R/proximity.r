##' @export
proximity <- function(x, ...)  UseMethod("proximity")

##' Extract sample proximities from grandforest.prediction object.
##'
##' The prediction object must have been called with type = "terminalNodes".
##'
##' @title Grand Forest sample proximity
##' @param x grandforest.prediction object.
##' @return "dist" object 
##' @export
proximity.grandforest.prediction <- function(x) {
  if(class(x) != "grandforest.prediction") {
      stop("Error: Input object to grandforest.prediction object.")
  }

  pred <- x$predictions

  num.vars <- nrow(pred)
  num.trees <- ncol(pred)
  
  prox <- matrix(0, nrow=num.vars, ncol=num.vars)
  
  for(i in seq(2, num.vars)) {
    for(j in seq(1, i-1)) {
      s <- sum(pred[i,] == pred[j,])
      prox[i,j] <- prox[i,j] + s
      prox[j,i] <- prox[j,i] + s
    }
  }
  
  prox <- prox / num.trees
  diag(prox) <- 1
  return(prox)
}

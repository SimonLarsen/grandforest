# -------------------------------------------------------------------------------
# This file is part of Grand Forest.
#
# Grand Forest is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Grand Forest is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Grand Forest. If not, see <http://www.gnu.org/licenses/>.
# -------------------------------------------------------------------------------

##' @export
proximity <- function(x, ...)  UseMethod("proximity")

##' Extract sample proximities from grandforest.prediction object.
##'
##' The prediction object must have been called with type = "terminalNodes".
##'
##' @title Grand Forest sample proximity
##' @param x grandforest.prediction object.
##' @param ... Further arguments passed to or from other methods.
##' @return Numeric matrix with sample similarities.
##' @aliases proximity
##' @export
proximity.grandforest.prediction <- function(x, ...) {
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

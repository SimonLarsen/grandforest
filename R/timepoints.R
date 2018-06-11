# -------------------------------------------------------------------------------
# This file is part of Grand Forest.
#
# Grand Forest incorporates work that is part of Ranger.
# See the original license notice below.
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# This file is part of Ranger.
#
# Ranger is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ranger is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ranger. If not, see <http://www.gnu.org/licenses/>.
#
# Written by:
#
#   Marvin N. Wright
# Institut fuer Medizinische Biometrie und Statistik
# Universitaet zu Luebeck
# Ratzeburger Allee 160
# 23562 Luebeck
# Germany
#
# http://www.imbs-luebeck.de
# -------------------------------------------------------------------------------

##' @export
timepoints <- function(x, ...)  UseMethod("timepoints")

##' Extract unique death times of Grand Forest Survival prediction object.
##'
##'
##' @title Grand Forest timepoints
##' @param x Grand Forest Survival prediction object.
##' @param ... Further arguments passed to or from other methods.
##' @return Unique death times
##' @seealso \code{\link{grandforest}}
##' @author Marvin N. Wright
##' @export
timepoints.grandforest.prediction <- function(x, ...) {
  if (class(x) != "grandforest.prediction") {
    stop("Object is not a grandforest.prediction object.")
  }
  if (x$treetype != "Survival") {
    stop("No timepoints found. Object is no Survival prediction object.")
  }
  if (is.null(x$unique.death.times)) {
    stop("No timepoints found.")
  }
  return(x$unique.death.times)
}

##' Extract unique death times of Grand Forest Survival forest
##'
##'
##' @title Grand Forest timepoints
##' @param x Grand Forest Survival forest object.
##' @param ... Further arguments passed to or from other methods.
##' @return Unique death times
##' @seealso \code{\link{grandforest}}
##' @author Marvin N. Wright
##' @aliases timepoints
##' @export
timepoints.grandforest <- function(x, ...) {
  if (class(x) != "grandforest") {
    stop("Object is not a grandforest object.")
  }
  if (x$treetype != "Survival") {
    stop("No timepoints found. Object is not a Survival forest.")
  }
  if (is.null(x$unique.death.times)) {
    stop("No timepoints found.")
  }
  return(x$unique.death.times)
}

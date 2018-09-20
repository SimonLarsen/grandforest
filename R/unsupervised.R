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

##' Train unsupervised Grand Forest model.
##' 
##' Helper function for training Grand Forest model for unsupervised analysis.
##' Generates a background data set by random sampling, then trains a Grand Forest model to
##' distinguish the foreground from the background.
##' 
##' @param data Training data of class \code{data.frame}, \code{matrix} or \code{gwaa.data} (GenABEL).
##' @param graph_data Feature interaction graph. Must be two-column character \code{data.frame} or \code{matrix} with character strings corresponding to column names in \code{data}.
##' @param replace Should background sampling be with replacement?
##' @param importance Variable importance mode, one of 'none', 'impurity', 'impurity_corrected', 'permutation'. The 'impurity' measure is the Gini index.
##' @param ... Other arguments to be passed to the \code{grandforest} function during training.
##' @export
grandforest_unsupervised <- function(data, graph_data, replace=TRUE, importance="impurity", ...) {
  bg <- apply(data, 2, function(x) sample(x, length(x), replace))
  
  D <- data.frame(
    "__GROUP_NAME__" = as.factor(c(rep("fg", nrow(data)), rep("bg", nrow(bg)))),
    rbind(data, bg),
    check.names = FALSE
  )
  
  grandforest(data=D, dependent.variable.name="__GROUP_NAME__", graph_data=graph_data, importance=importance, ...)
}

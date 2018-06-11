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
##' @export
grandforest_unsupervised <- function(data, graph_data=NULL, replace=TRUE, importance="impurity", ...) {
  bg <- apply(data, 2, function(x) sample(x, length(x), replace))
  
  D <- data.frame(
    "__GROUP_NAME__" = as.factor(c(rep("fg", nrow(data)), rep("bg", nrow(bg)))),
    rbind(data, bg),
    check.names = FALSE
  )
  
  grandforest(data=D, dependent.variable.name="__GROUP_NAME__", graph_data=graph_data, importance=importance, ...)
}

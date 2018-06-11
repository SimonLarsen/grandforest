# -------------------------------------------------------------------------------
#   This file is part of Ranger.
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

#' Parse formula
#' 
#' Parse formula and return dataset containing selected columns. 
#' Interactions are supported for numerical columns only. 
#' An interaction column is the product of all interacting columns.
#'
#' @param formula Object of class \code{formula} or \code{character} describing the model to fit.
#' @param data Training data of class \code{data.frame}.
#'
#' @return Dataset including selected columns and interactions.
parse.formula <- function(formula, data) {
  f <- as.formula(formula)
  t <- terms(f, data = data)
  
  ## Get dependent var(s)
  response <- data.frame(eval(f[[2]], envir = data))
  colnames(response) <- deparse(f[[2]])
  
  ## Get independent vars
  independent_vars <- attr(t, "term.labels")
  interaction_idx <- grepl(":", independent_vars)
  
  ## Error if illegal column name
  if (!all(make.names(independent_vars[!interaction_idx]) == independent_vars[!interaction_idx])) {
    stop("Error: Illegal column names in formula interface. Fix column names or use alternative interface in grandforest")
  }
  
  ## Shortcut if no interactions
  if (all(!interaction_idx)) {
    return(data.frame(response, data[, independent_vars, drop = FALSE], check.names = FALSE))
  }
  
  ## Get interaction columns
  if (any(interaction_idx)) {
    interaction_vars <- independent_vars[interaction_idx]
    dat_interaction <- sapply(strsplit(interaction_vars, ":"), function(x) {
      if (any(!sapply(data[, x, drop = FALSE], is.numeric))) {
        stop("Error: Only numeric columns allowed in interaction terms.")
      }
      with(data, eval(parse(text = paste(x, collapse = "*"))))
    })
    colnames(dat_interaction) <- interaction_vars
  }
  
  ## Get main effect columns
  if (any(!interaction_idx)) {
    main_vars <- independent_vars[!interaction_idx]
    dat_main <- data[, main_vars, drop = FALSE]
  }
  
  ## Return combined data frame
  if (any(!interaction_idx)) {
    data.frame(response, dat_main, dat_interaction, check.names = FALSE)
  } else {
    data.frame(response, dat_interaction, check.names = FALSE)
  }
}

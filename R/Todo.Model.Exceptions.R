Todo.Model.Exceptions <- \(){
  exceptions <- list()

  # Structural Validation Exceptions
  exceptions[["TodoIsNull"]]   <- \(invoke) {
    if (invoke) { stop("successful validation requires a data frame with todo")}
  }

  exceptions[["IdIsNull"]]     <- \(invoke) {
    if (invoke) { stop("todo data frame has no Id")}
  }

  exceptions[["TaskIsNull"]]   <- \(invoke) {
    if (invoke) { stop("todo data frame has no Task")}
  }
  
  return(exceptions)
}
Todo.Model.Exceptions <- \(){
  exceptions <- list()

  # Structural Validation Exceptions
  exceptions[["TodoIsNull"]]   <- \(invoke) {
    if (invoke) { stop("successful validation requires a data frame with todo")}
  }
  
  return(exceptions)
}
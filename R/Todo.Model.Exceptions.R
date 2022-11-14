Todo.Model.Exceptions <- \(){
  exceptions <- list()

  # Structural Validation Exceptions
  exceptions[["TodoIsNull"]]   <- \(invoke) {
    if (invoke) { stop("successful validation requires a data frame with todo")}
  }

  exceptions[["TodoIdIsNull"]]     <- \(invoke) {
    if (invoke) { stop("todo data frame has no Id")}
  }

  exceptions[["TodoTaskIsNull"]]   <- \(invoke) {
    if (invoke) { stop("todo data frame has no Task")}
  }

  exceptions[["TodoStatusIsNull"]] <- \(invoke) {
    if (invoke) { stop("todo data frame has no Status")}
  }

  exceptions[["IdIsNull"]] <- \(invoke) {
    if (invoke) { stop("successful validation requires an Id")}
  }

  # Logical Validation Exceptions
  exceptions[["DuplicateKey"]]  <- \(invoke) {
    if (invoke) { stop("todo already exist, duplicate key not allowed") }
  }
  
  return(exceptions)
}
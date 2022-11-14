Todo.Model.Validation.Service <- \(){
  exception <- Todo.Model.Exceptions()
  
  validators <- list()

  validators[["TodoExist"]] <- \(todo) {
    todo |> is.null() |> exception[["TodoIsNull"]]()
    return(todo)
  }

  validators[["HasId"]]     <- \(todo) {
    todo[["Id"]] |> is.null() |> exception[["IdIsNull"]]()
    return(todo)
  }

  return(validators)  
}
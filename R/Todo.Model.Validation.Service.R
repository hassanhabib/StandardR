Todo.Model.Validation.Service <- \(){
  exception <- Todo.Model.Exceptions()
  
  validators <- list()

  validators[["TodoExist"]] <- \(todo) {
    todo |> is.null() |> exception[["TodoIsNull"]]()
    return(todo)
  }

  return(validators)  
}
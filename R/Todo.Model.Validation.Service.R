Todo.Model.Validation.Service <- \(){
  exception <- Todo.Model.Exceptions()
  
  validators <- list()

  validators[["Todo"]]      <- \(todo) {
    todo |>
      validators[["TodoExist"]]() |>
      validators[["HasId"]]()     |>
      validators[["HasTask"]]()   |>
      validators[["HasStatus"]]()  
  }

  validators[["TodoExist"]] <- \(todo) {
    todo |> is.null() |> exception[["TodoIsNull"]]()
    return(todo)
  }

  validators[["HasId"]]     <- \(todo) {
    todo[["Id"]] |> is.null() |> exception[["TodoIdIsNull"]]()
    return(todo)
  }

  validators[["HasTask"]]   <- \(todo) {
    todo[["Task"]] |> is.null() |> exception[["TodoTaskIsNull"]]()
    return(todo)
  }

  validators[["HasStatus"]] <- \(todo) {
    todo[["Status"]] |> is.null() |> exception[["TodoStatusIsNull"]]()
      return(todo)
  }

  validators[["IdExist"]] <- \(id) {
    id |> is.null() |> exception[["IdIsNull"]]()
    return(id)
  }

  # Logical Logical Validation
  validators[["IsDuplicate"]] <- \(todo,todos) {
    match.count <- 
      todos |>
        dplyr::filter(Id == todo[["Id"]]) |> 
          nrow()
        
    (match.count != 0) |> exception[["DuplicateKey"]]()

    return(todo)
  }

  return(validators)  
}
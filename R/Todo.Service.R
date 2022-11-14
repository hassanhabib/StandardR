Todo.Service <- \(broker){
  validate <- Todo.Model.Validation.Service()
  
  services <- list()

  services[["Add"]]     <- \(todo) {
    todos <- broker[['Select']]()
    
    todo |>
      validate[['Todo']]() |>
      validate[['IsDuplicate']](todos)
    
    todo |>
      broker[['Insert']]()

    return(data.frame())
  }

  services[['Retrieve']] <- \(...) {
    ... |> broker[['Select']]()
  }

  services[["RetrieveById"]] <- \(id) {
    id |>
      validate[['IdExist']]()

    id |> 
      broker[['SelectById']]()
  }

  services[['Update']] <- \(todo){
    todo |>
      validate[['Todo']]()
    
    todo |>
      broker[['Update']]()

    return(data.frame())
  }  
  
  return(services)
}
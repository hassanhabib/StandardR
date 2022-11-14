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
  
  return(services)
}
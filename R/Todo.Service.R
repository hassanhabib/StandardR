Todo.Service <- \(broker){
  validate <- Todo.Model.Validation.Service()
  
  services <- list()

  services[["Add"]]     <- \(todo) {
    todo |>
      validate[['Todo']]()
    
    todo |>
      broker[['Insert']]()

    return(data.frame())
  }
  
  return(services)
}
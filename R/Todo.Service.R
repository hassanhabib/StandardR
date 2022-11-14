Todo.Service <- \(broker){
  validate <- Todo.Model.Validation.Service()
  
  services <- list()

  services[["Add"]]     <- \(todo) {
    todo |>
      validate[['HasId']]()
    
    todo |>
      broker[['Insert']]()

    return(data.frame())
  }
  
  return(services)
}
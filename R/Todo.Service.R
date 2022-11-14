Todo.Service <- \(broker){
  validate <- Todo.Model.Validation.Service()
  
  services <- list()

  services[["Add"]]     <- \(todo) {
    todo |>
      validate[['TodoExist']]() |>
      validate[['HasId']]()     |>
      validate[['HasTask']]()   |>
      validate[['HasStatus']]() 
    
    todo |>
      broker[['Insert']]()

    return(data.frame())
  }
  
  return(services)
}
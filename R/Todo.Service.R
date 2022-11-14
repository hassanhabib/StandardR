Todo.Service <- \(broker){
  services <- list()

  services[["Add"]]     <- \(todo) {
    todo |>
      broker[['Insert']]()

    return(data.frame())
  }
  
  return(services)
}
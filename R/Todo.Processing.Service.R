Todo.Processing.Service <- \(todo.service){
  service <- list()

  service[['Upsert']] <- \(todo) {
    todo.count <- 
      todo[['Id']] |> 
      todo.service[['RetrieveById']]() |> 
      nrow()
    
    if (todo.count == 0) {
      todo |> todo.service[['Add']]()
    }
  }

  return(service)
}
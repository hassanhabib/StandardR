Todo.Broker <- \(storage){
  operations <- list()

  operations[['Insert']] <- \(todo){
    todo |> storage[['Todo']][['Insert']]()
  }

  operations[['Select']] <- \(...){
    ... |> storage[['Todo']][['Select']]()   
  }

  operations[['SelectById']] <- \(id){
    id |> storage[['Todo']][['SelectWhereId']]()
  }

  operations[['Update']] <- \(todo){
    todo |> storage[['Todo']][['Update']]()
  }

  operations[['Delete']] <- \(id){
    id |> storage[['Todo']][['Delete']]()
  }

  return(operations)
}
Todo.Broker <- \(storage){
    operations <- list()

    operations[['Create']] <- \(todo){
        todo |> storage[['Todo']][['Insert']]()
    }

    return(operations)
}
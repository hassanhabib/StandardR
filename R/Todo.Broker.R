Todo.Broker <- \(storage){
    operations <- list()

    operations[['Create']] <- \(todo){
        todo |> storage[['Todo']][['Insert']]()
    }

    operations[['Retrieve']] <- \(...){
        ...  |> storage[['Todo']][['Select']]()   
    }

    return(operations)
}
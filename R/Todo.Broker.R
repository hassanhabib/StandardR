Todo.Broker <- \(storage){
    operations <- list()

    operations[['Create']] <- \(todo){
        todo |> storage[['Todo']][['Insert']]()
    }

    operations[['Retrieve']] <- \(...){
        ...  |> storage[['Todo']][['Select']]()   
    }

    operations[['RetrieveById']] <- \(id){
        id   |> storage[['Todo']][['SelectWhereId']]()
    }

    return(operations)
}
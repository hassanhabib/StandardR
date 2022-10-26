TodoService <- \(broker) {
  service <- list()
  service[["AddTodo"]]    <- \(todo) todo |> broker[["CreateTodo"]]()
  service[["GetTodos"]]   <- \()             broker[["RetrieveTodos"]]()
  service[["UpdateTodo"]] <- \(todo) todo |> broker[["UpdateTodo"]]()
  service[["DeleteTodo"]] <- \(id)     id |> broker[["DeleteTodo"]]()

  return(service)
}

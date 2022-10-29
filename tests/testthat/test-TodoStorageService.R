test_that("todo |> TodoStorageService[['AddTodo']]() add todo to data store", {
  # Given
  broker  <- TodoStorageBroker.mock()
  service <- TodoStorageService(broker)

  id     <- '5ab2da6f-2e8f-44b4-74bf-2004df1c16ab'
  task   <- 'Task.4'
  status <- 'New'

  todo <- data.frame(
    Id     = id,
    Task   = task,
    Status = status
  )

  inputTodo    <- todo
  insertedTodo <- inputTodo
  expectedTodo <- insertedTodo

  # When
  inputTodo |> service[["AddTodo"]]()

  # Then
  broker[["RetrieveTodos"]]() |>
    filter(Id == insertedTodo[["Id"]]) |>
      expect_equal(expectedTodo)
})
test_that("TodoStorageService[['GetTodos']]() retrive all todos from data store", {
  # Given
  broker  <- TodoStorageBroker.mock()
  service <- TodoStorageService(broker)

  # When
  todos <- service[["GetTodos"]]()

  # Then
  broker[["RetrieveTodos"]]() |>
    expect_equal(todos)
})
test_that("todo |> TodoStorageService[['UpdateTodo']]() updates todo in data store", {
  # Given
  broker  <- TodoStorageBroker.mock()
  service <- TodoStorageService(broker)

  id     <- '7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae'
  task   <- 'Task.1'
  status <- 'Complete'

  todo <- data.frame(
    Id     = id,
    Task   = task,
    Status = status
  )

  inputTodo    <- todo
  updatedTodo  <- inputTodo
  expectedTodo <- updatedTodo

  # When
  inputTodo |> service[["UpdateTodo"]]()

  # Then
  broker[["RetrieveTodos"]]() |>
    filter(Id == updatedTodo[["Id"]]) |>
      expect_equal(expectedTodo)
})
test_that("Id |> Todo.Service[['DeleteTodo']]() removes todo from data store", {
  # Given
  broker  <- TodoStorageBroker.mock()
  service <- TodoStorageService(broker)

  id     <- '7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae'

  inputId           <- id
  deletedTodoId     <- inputId
  expectedTodoCount <- 0

  # When
  inputId |> service[["DeleteTodo"]]()

  # Then
  broker[["RetrieveTodos"]]() |>
    filter(Id == deletedTodoId) |>
    nrow() |>
      expect_equal(expectedTodoCount)
})

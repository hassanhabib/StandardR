test_that("Todo.Processing.Service Exist",{
  Todo.Processing.Service |>
    is.null() |>
        expect_equal(FALSE)
})

test_that("todo.service |> Todo.Processing.Service() returns a list of user services",{
  # Given
  configuration <- data.frame()
  storage <- configuration |> Storage::Mock.Storage.Service()
    
  todo.processing.service <-
    storage |>
    Todo.Broker() |> 
    Todo.Service() |> 
    Todo.Processing.Service()

  # Then
  todo.processing.service |>
    is.list() |>
      expect_equal(TRUE)
})

test_that("todo.processing.service instance has Upsert service",{
  # Given
  configuration <- data.frame()
  storage <- configuration |> Storage::Mock.Storage.Service()

  todo.processing.service <-
    storage |>
      Todo.Broker() |> 
      Todo.Service() |> 
      Todo.Processing.Service()

  # Then
  todo.processing.service[['Upsert']]  |>
    is.null()            |>
      expect_equal(FALSE)
})

test_that("todo |> todo.processing.service[['Upsert']]() should add todo if not exist",{
  # Given
  configuration <- data.frame()
  storage <- configuration |> Storage::Mock.Storage.Service()

  todo.service <-
    storage |>
      Todo.Broker() |> 
      Todo.Service()
    
  todo.processing.service <-
    todo.service |>
      Todo.Processing.Service()

  todo <- data.frame(
    Id     = uuid::UUIDgenerate(),
    Task   = 'Task.X',
    Status = 'New'
  )

  # When
  todo |> 
    todo.processing.service[['Upsert']]()

  # Then
  todo[['Id']] |> 
    todo.service[['RetrieveById']]() |>
      expect_equal(todo)
})

test_that("todo |> todo.processing.service[['Upsert']]() should update todo if exist",{
  # Given
  configuration <- data.frame()
  storage <- configuration |> Storage::Mock.Storage.Service()

  todo.service <-
    storage |>
      Todo.Broker() |> 
      Todo.Service()
    
  todo.processing.service <-
    todo.service |>
      Todo.Processing.Service()

  todo             <- todo.service[['Retrieve']]() |> head(1)
  todo[['Status']] <- 'DONE'

  # When
  todo |> 
    todo.processing.service[['Upsert']]()

  # Then
  todo[['Id']] |> 
    todo.service[['RetrieveById']]() |>
      expect_equal(todo)
})
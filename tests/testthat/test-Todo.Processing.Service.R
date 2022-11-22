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
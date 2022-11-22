 test_that("Todo.Processing.Service Exist",{
  Todo.Processing.Service |>
    is.null() |>
        expect_equal(FALSE)
 })

 test_that("todo.service |> Todo.Processing.Service() returns a list of user services",{
  # Given
  configuration <- data.frame()

  storage <- 
    configuration |> Storage::Mock.Storage.Service()

  todo.broker <-
    storage |> Todo.Broker()  

  todo.service <- 
    todo.broker |> Todo.Service()

  todo.processing.service <-
    todo.service |> Todo.Processing.Service()

  # Then
  todo.processing.service |>
    is.list() |>
      expect_equal(TRUE)
 })

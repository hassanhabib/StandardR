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

  user.broker <-
    storage |> Todo.Broker()  

  user.service <- 
    user.broker |> Todo.Service()

  user.processing.service <-
    user.service |> Todo.Processing.Service()

  # Then
  user.processing.service |>
    is.list() |>
      expect_equal(TRUE)
 })

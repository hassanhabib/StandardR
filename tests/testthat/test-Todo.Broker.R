test_that("Todo.Broker Exist",{
  Todo.Broker |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("configuration |> Todo.Broker() returns a list of operations",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()

  # When
  todo.broker <- 
    storage |> Todo.Broker() 
  
  # Then
  todo.broker |>
    is.list() |>
      expect_equal(TRUE)
})

test_that("todo.broker instance contain Create operation",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()

  # When
  todo.broker <- 
    storage |> Todo.Broker()

  # Then
  todo.broker[['Create']] |>
    is.null()             |>
      expect_equal(FALSE) 
})

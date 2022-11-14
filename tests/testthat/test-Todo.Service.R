test_that("Todo.Service Exist",{
  Todo.Service |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("broker |> Todo.Service() returns a list of services",{
# Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.broker <-
    storage |> Todo.Broker()     
        
  services <- 
    todo.broker |> Todo.Service()

  # Then
  services |>
    is.list() |>
      expect_equal(TRUE)
})
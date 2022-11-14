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

test_that("todo.service instance has Add operation", {
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.service <-
    storage           |> 
      Todo.Broker()   |> 
        Todo.Service()

  # Then
  todo.service[['Add']]  |>
    is.null()            |>
      expect_equal(FALSE)
})

test_that("todo |> todo.service[['Add']]() should add todo if todo is valid",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.broker <-
    storage |> Todo.Broker()
      
  todo.service <-
    todo.broker |> Todo.Service()
  
  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Task = 'Task',
    Status = 'New'
  )

  # When
  todo |> 
    todo.service[["Add"]]()

  # Then
  todo[['Id']] |>
    todo.broker[['SelectById']]() |>
      expect_equal(todo)
})

test_that("todo |> todo.service[['Add']]() should throw error if todo has no Id",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.broker <-
    storage |> 
      Todo.Broker()
      
  todo.service <-
    todo.broker |> 
        Todo.Service()

  todo <- data.frame(
    Task = 'Task',
    Status = 'New'
  )

  error <- 'todo data frame has no Id'

  # Then
  todo |> 
    todo.service[["Add"]]() |>
      expect_error(error)
})

test_that("todo |> todo.service[['Add']]() should throw error if todo has no Task",{
 # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.broker <-
    storage |> Todo.Broker()
      
  todo.service <-
    todo.broker |> Todo.Service()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Status = 'New'
  )

  error <- 'todo data frame has no Task'

  # Then
  todo |> 
    todo.service[["Add"]]() |>
      expect_error(error)
})

test_that("todo |> todo.service[['Add']]() should throw error if todo has no Status",{
 # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.broker <-
    storage |> Todo.Broker()
      
  todo.service <-
    todo.broker |> Todo.Service()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Task = 'Task'
  )

  error <- 'todo data frame has no Status'

  # Then
  todo |> 
    todo.service[["Add"]]() |>
      expect_error(error)
})

test_that("todo |> todo.service[['Add']]() should throw error if todo is null",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.broker <-
    storage |> Todo.Broker()
      
  todo.service <-
    todo.broker |> Todo.Service()

  todo <- NULL

  error <- 'successful validation requires a data frame with todo'

  # Then
  todo |> 
    todo.service[["Add"]]() |>
      expect_error(error)
})

test_that("todo |> todo.service[['Add']]() should throw error if todo already exist",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.broker <-
    storage |> 
      Todo.Broker()
      
  todo.service <-
    todo.broker |> 
        Todo.Service()

  todo <- todo.broker[["Select"]]() |> head(1)
  error <- 'todo already exist, duplicate key not allowed'

  # Then
  todo |> 
    todo.service[["Add"]]() |>
        expect_error(error)
})

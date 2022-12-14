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

test_that("todo.service instance has Retrieve operation", {
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.service <-
    storage           |> 
      Todo.Broker()   |> 
        Todo.Service()

  # Then
  todo.service[['Retrieve']]  |>
    is.null()            |>
      expect_equal(FALSE)

})

test_that("todo.service[['Retrieve']]() should return a data.frame with zero of many todos", {
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.service <-
    storage           |> 
      Todo.Broker()   |> 
        Todo.Service()

  # Then
  todo.service[['Retrieve']]() |>
    is.data.frame()       |>
      expect_equal(TRUE)
})

test_that("todo.service instance has RetrieveById operation",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.service <-
    storage           |> 
      Todo.Broker()   |> 
        Todo.Service()

  # Then
  todo.service[['RetrieveById']]  |>
    is.null()            |>
      expect_equal(FALSE)
})

test_that("id |> todo.service[['RetrieveById']]() should return todo if todo exist",{
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
  
  todo <- 
    todo.service[['Retrieve']]() |> head(1) 

  # When
  retrieved.todo <-
    todo[['Id']] |> todo.service[['RetrieveById']]()
    
  # Then
  retrieved.todo  |>
    expect_equal(todo)
})

test_that("id |> todo.service[['RetrieveById']]() throws IdIsNull exception if id is null",{
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
  
  error <- 'successful validation requires an Id'

  # Then
  NULL |> 
    todo.service[['RetrieveById']]() |>
      expect_error(error)
})

test_that("todo.service instance has Update operation",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.service <-
    storage           |> 
      Todo.Broker()   |> 
        Todo.Service()

  # Then
  todo.service[['Update']]  |>
    is.null()            |>
      expect_equal(FALSE)
})

test_that("todo |> todo.service[['Update']]() should update todo if todo exist",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service() 

  todo.broker <-
    storage |> Todo.Broker() 
  
  todo.service <-
    todo.broker |> Todo.Service()

  existing.todo <- todo.broker[['Select']]() |> tail(1)

  updated.todo <- existing.todo
  updated.todo[['Status']] <- 'Done'

  # When
  updated.todo |> todo.service[['Update']]()

  # Then
  retrieved.todo <-
    existing.todo[['Id']] |>
    todo.broker[['SelectById']]()

  retrieved.todo[['Id']]     |> expect_equal(updated.todo[['Id']])
  retrieved.todo[['Task']]   |> expect_equal(updated.todo[['Task']])
  retrieved.todo[['Status']] |> expect_equal(updated.todo[['Status']])
})

test_that("todo |> todo.service[['Update']]() should throw error if todo has no Id",{
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
    todo.service[["Update"]]() |>
      expect_error(error)
})

test_that("todo |> todo.service[['Update']]() should throw error if todo has no Task",{
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
    todo.service[["Update"]]() |>
      expect_error(error)
})

test_that("todo |> todo.service[['Update']]() should throw error if todo has no Status",{
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
    todo.service[["Update"]]() |>
      expect_error(error)
})

test_that("todo |> todo.service[['Update']]() should throw error if todo is null",{
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
    todo.service[["Update"]]() |>
      expect_error(error)
})

test_that("todo.service instance has Delete operation",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()    
  
  todo.service <-
    storage           |> 
      Todo.Broker()   |> 
        Todo.Service()

  # Then
  todo.service[['Delete']]  |>
    is.null()            |>
      expect_equal(FALSE)
})

test_that("id |> todo.service[['Delete']]() should delete todo if todo exist",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service() 

  todo.broker <-
    storage |> Todo.Broker() 
  
  todo.service <-
    todo.broker |> Todo.Service()

  existing.todo <- todo.broker[['Select']]() |> tail(1)

  # When
  existing.todo[['Id']] |> todo.service[['Delete']]()

  # Then
  existing.todo[['Id']] |>
    todo.broker[['SelectById']]() |>
      nrow()           |>
        expect_equal(0)
})

test_that("id |> todo.service[['Delete']]() should throw IdIsNull exception if id is null",{
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
  
  error <- 'successful validation requires an Id'

  # Then
  NULL |> 
    todo.service[['Delete']]() |>
      expect_error(error)
})
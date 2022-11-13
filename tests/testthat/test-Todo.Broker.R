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

test_that("todo.broker instance has Create operation",{
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

test_that("todo |> todo.broker[['Create']]() creates a new todo into storage",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> 
      Storage::Mock.Storage.Service()

  todo.broker <- 
    storage |>
      Todo.Broker()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Task = 'Task',
    Status = 'New'
  )

  new.todo <- todo
  expected.todo <- new.todo

  # When
  new.todo |>
    todo.broker[['Create']]()

  # Then
  new.todo[['Id']] |>
    storage[['Todo']][['SelectWhereId']]() |>
      expect_equal(expected.todo)
})

test_that("todo.broker instance has Retrieve operation",{
    # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()

  # When
  todo.broker <- 
    storage |> Todo.Broker()

  # Then
  todo.broker[['Retrieve']] |>
    is.null()             |>
      expect_equal(FALSE) 
  
})

test_that("todo.broker[['Retrieve']]() retrieves todos from storage",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> 
      Storage::Mock.Storage.Service()

  todo.broker <- 
    storage |>
      Todo.Broker()


  # When
  todos <- todo.broker[['Retrieve']]()

  # Then
  storage[['Todo']][['Select']]() |>
      expect_equal(todos)
})

test_that("todo.broker instance has RetrieveById operation",{
    # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()

  # When
  todo.broker <- 
    storage |> Todo.Broker()

  # Then
  todo.broker[['RetrieveById']] |>
    is.null()             |>
      expect_equal(FALSE) 
  
})

test_that("id |> todo.broker[['RetrieveById']]() retrieves todo with matching id from storage",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> 
      Storage::Mock.Storage.Service()

  todo.broker <- 
    storage |>
      Todo.Broker()

  existing.todo <- 
    storage[['Todo']][['Select']]() |> 
      tail(1)

  input.todo <- existing.todo
  expected.todo <- existing.todo
  
  # When
  retrieved.todo <- 
    input.todo[['Id']] |> 
      todo.broker[['RetrieveById']]()
  
  # Then
  retrieved.todo[['Id']]     |> expect_equal(existing.todo[["Id"]])
  retrieved.todo[['Task']]   |> expect_equal(existing.todo[["Task"]])
  retrieved.todo[['Status']] |> expect_equal(existing.todo[["Status"]])
})

test_that("todo.broker instance has Update operation",{
    # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()

  # When
  todo.broker <- 
    storage |> Todo.Broker()

  # Then
  todo.broker[['Update']] |>
    is.null()             |>
      expect_equal(FALSE) 
  
})

test_that("todo |> broker[['Update']]() updates existing todo in storage",{
  # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> 
      Storage::Mock.Storage.Service()

  todo.broker <- 
    storage |>
      Todo.Broker()

  existing.todo <- 
    storage[['Todo']][['Select']]() |> 
      tail(1)

  updated.todo <- existing.todo
  updated.todo[['Status']] <- 'Done'

  expected.todo <- updated.todo
  
  # When
  updated.todo |> todo.broker[['Update']]()
  
  retrieved.todo <-
    updated.todo[['Id']] |>
      storage[['Todo']][['SelectWhereId']]()
  
  # Then
  updated.todo[['Id']]     |> expect_equal(retrieved.todo[['Id']])
  updated.todo[['Task']]   |> expect_equal(retrieved.todo[['Task']])
  updated.todo[['Status']] |> expect_equal(retrieved.todo[['Status']])

})

test_that("todo.broker instance has Delete operation",{
    # Given
  configuration <- data.frame()
  
  storage <- 
    configuration |> Storage::Mock.Storage.Service()

  # When
  todo.broker <- 
    storage |> Todo.Broker()

  # Then
  todo.broker[['Delete']] |>
    is.null()             |>
      expect_equal(FALSE) 
})

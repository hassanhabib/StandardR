test_that("Todo.Model.Validation.Service Exist",{
  Todo.Model.Validation.Service |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("Todo.Model.Validation.Service() returns a list of validators",{
  # Given
  validators <- Todo.Model.Validation.Service()
  
  # Then
  validators |>
    is.list() |>
      expect_equal(TRUE)
})

test_that("todo.model.validation.service instance has TodoExist validator",{
  # Given
  validator <- Todo.Model.Validation.Service()

  # Then
  validator[['TodoExist']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("todo |> validate[['TodoExist']]() should not throw error if todo exist",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame()
    
  # Then
  todo |> 
    validate[['TodoExist']]() |>
      expect_no_error()
})

test_that("todo |> validate[['TodoExist']]() should throw error if todo is null",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- NULL
  error <- "successful validation requires a data frame with todo"

  # Then
  todo |> 
    validate[['TodoExist']]() |>
      expect_error(error)
})

test_that("todo.model.validation.service instance has HasId validator",{
  # Given
  validator <- Todo.Model.Validation.Service()

  # Then
  validator[['HasId']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("todo |> validate[['HasId']]() should not throw error if todo has Id exist",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame(
    Id = 'Id'
  )
    
  # Then
  todo |> 
    validate[['HasId']]() |>
      expect_no_error()
})

test_that("todo |> validate[['HasId']]() should throw error if todo has no Id",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame()
  error <- "todo data frame has no Id"

  # Then
  todo |> 
    validate[['HasId']]() |>
      expect_error(error)
})

test_that("todo.model.validation.service instance has TodoTask validator",{
  # Given
  validator <- Todo.Model.Validation.Service()

  # Then
  validator[['HasTask']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("todo |> validate[['HasTask']]() should not throw error if todo has Task exist",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame(
    Task = 'Task'
  )
    
  # Then
  todo |> 
    validate[['HasTask']]() |>
      expect_no_error()
})

test_that("todo |> validate[['HasTask']]() should throw error if todo has no Task",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame()
  error <- "todo data frame has no Task"

  # Then
  todo |> 
    validate[['HasTask']]() |>
      expect_error(error)
})

test_that("todo.model.validation.service instance has HasStatus validator",{
  # Given
  validator <- Todo.Model.Validation.Service()

  # Then
  validator[['HasStatus']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("todo |> validate[['HasStatus']]() should not throw error if todo has Status exist",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame(
    Status = 'Status'
  )
    
  # Then
  todo |> 
    validate[['HasStatus']]() |>
      expect_no_error()
})

test_that("todo |> validate[['HasStatus']]() should throw error if todo has no Status",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame()
  error <- "todo data frame has no Status"

  # Then
  todo |> 
    validate[['HasStatus']]() |>
      expect_error(error)
})

test_that("todo.model.validation.service instance has Todo validator",{
  # Given
  validator <- Todo.Model.Validation.Service()

  # Then
  validator[['Todo']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("todo |> validate[['Todo']]() should not throw error if todo is valid",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame(
    Id     = 'Id',
    Task   = 'Task',
    Status = 'Status'
  )
    
  # Then
  todo |> 
    validate[['Todo']]() |>
      expect_no_error()
})

test_that("Todo |> validate[['Todo']]() should throw error if todo is null",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- NULL
  error <- "successful validation requires a data frame with todo"
    
  # Then
  todo |> 
    validate[['Todo']]() |>
      expect_error(error)
})

test_that("Todo |> validate[['Todo']]() should throw error if todo has no Id",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame()
  error <- "todo data frame has no Id"
    
  # Then
  todo |> 
    validate[['Todo']]() |>
      expect_error(error)
})

test_that("Todo |> validate[['Todo']]() should throw error if todo has no Task",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame(
    Id = 'Id'
  )
  error <- "todo data frame has no Task"
    
  # Then
  todo |> 
    validate[['Todo']]() |>
      expect_error(error)
})

test_that("todo |> validate[['Todo']]() should throw error if todo has no Status",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todo  <- data.frame(
    Id     = 'Id',
    Task   = 'Task'
  )
  error <- "todo data frame has no Status"
    
  # Then
  todo |> 
    validate[['Todo']]() |>
      expect_error(error)
})

test_that("todo.model.validation.service instance has IsDuplicate validator",{
  # Given
  validator <- Todo.Model.Validation.Service()

  # Then
  validator[['IsDuplicate']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("todo |> validate[['IsDuplicate']]() should not throw error if todo does not exist in todos",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todos <- data.frame(
      Id     = c('7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
               '7bfef861-6fe9-46da-9ad2-6a58779ccdcd',
               'd3b59bf0-14f0-4444-9ec9-1913e7256ee4'),
    Task   = c('Task.1','Task.2','Task.3'),
    Status = c('New','New','Done')
  )

  todo  <- data.frame(
    Id     = uuid::UUIDgenerate(),
    Task   = 'Task',
    Status = 'New'
  )
    
  # Then
  todo |> 
    validate[['IsDuplicate']](todos) |>
      expect_no_error()
})

test_that("todo |> validate[['IsDuplicate']]() should throw error if todo exist in todos",{
  # Given
  validate <- Todo.Model.Validation.Service()

  todos <- data.frame(
    Id     = c('7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
               '7bfef861-6fe9-46da-9ad2-6a58779ccdcd',
               'd3b59bf0-14f0-4444-9ec9-1913e7256ee4'),
    Task   = c('Task.1','Task.2','Task.3'),
    Status = c('New','New','Done')
  )

  todo  <- todos |> head(1)
  error <- 'todo already exist, duplicate key not allowed'
    
  # Then
  todo |> 
    validate[['IsDuplicate']](todos) |>
      expect_error(error)
})

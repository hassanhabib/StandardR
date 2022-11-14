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

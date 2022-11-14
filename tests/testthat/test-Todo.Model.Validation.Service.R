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
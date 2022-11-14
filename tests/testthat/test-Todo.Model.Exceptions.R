test_that("Todo.Model.Exceptions Exist",{
  Todo.Model.Exceptions |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("Todo.Model.Exceptions() returns a list of exceptions",{
  # Given
  exceptions <- Todo.Model.Exceptions()
  
  # Then
  exceptions |>
    is.list() |>
      expect_equal(TRUE)
})

test_that("todo.model.exceptions instance has TodoIsNull exception",{
    # Given
    exception <- Todo.Model.Exceptions()

    # Then
    exception[["TodoIsNull"]]  |>
      is.null()             |>
        expect_equal(FALSE)
})

test_that("FALSE |> exception[['TodoIsNull']]() should not throw error",{
    # Given
    exception <- Todo.Model.Exceptions()

    # Then
    FALSE |>
      exception[["TodoIsNull"]]() |>
        expect_no_error()
})

test_that("TRUE |> exception[['TodoIsNull']]() should throw TodoIsNull error",{
    # Given
    exception <- Todo.Model.Exceptions()

    error <- 'successful validation requires a data frame with todo'

    # Then
    TRUE |>
      exception[["TodoIsNull"]]() |>
        expect_error(error)
})
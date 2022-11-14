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

test_that("todo.model.exceptions instance has TodoIdIsNull exception",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  exception[["TodoIdIsNull"]]  |>
    is.null()             |>
      expect_equal(FALSE)
})

test_that("FALSE |> exception[['TodoIdIsNull']]() should not throw error",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  FALSE |>
    exception[["TodoIdIsNull"]]() |>
      expect_no_error()
})

test_that("TRUE |> exception[['TodoIdIsNull']]() should throw TodoIdIsNull error",{
  # Given
  exception <- Todo.Model.Exceptions()

  error <- 'todo data frame has no Id'

  # Then
  TRUE |>
    exception[["TodoIdIsNull"]]() |>
      expect_error(error)
})

test_that("todo.model.exceptions instance has TodoTaskIsNull exception",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  exception[["TodoTaskIsNull"]] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("FALSE |> exception[['TodoTaskIsNull']]() should not throw error",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  FALSE |>
    exception[["TodoTaskIsNull"]]() |>
      expect_no_error()
})

test_that("TRUE |> exception[['TodoTaskIsNull']]() should throw TodoTaskIsNull error",{
  # Given
  exception <- Todo.Model.Exceptions()

  error <- 'todo data frame has no Task'

  # Then
  TRUE |>
    exception[["TodoTaskIsNull"]]() |>
      expect_error(error)
})

test_that("todo.model.exceptions instance has TodoStatusIsNull exception",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  exception[["TodoStatusIsNull"]]  |>
    is.null()             |>
      expect_equal(FALSE)
})

test_that("FALSE |> exception[['TodoStatusIsNull']]() should not throw error",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  FALSE |>
    exception[["TodoStatusIsNull"]]() |>
      expect_no_error()
})

test_that("TRUE |> exception[['TodoStatusIsNull']]() should throw TodoStatusIsNull error",{
  # Given
  exception <- Todo.Model.Exceptions()

  error <- 'todo data frame has no Status'

  # Then
  TRUE |>
    exception[["TodoStatusIsNull"]]() |>
      expect_error(error)
})

test_that("todo.model.exceptions instance has DuplicateKey exception",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  exception[["DuplicateKey"]]  |>
    is.null()             |>
      expect_equal(FALSE)
})

test_that("FALSE |> exception[['DuplicateKey']]() should not throw error",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  FALSE |>
    exception[["DuplicateKey"]]() |>
      expect_no_error()
})

test_that("TRUE |> exception[['DuplicateKey']]() should throw DuplicateKey error",{
  # Given
  exception <- Todo.Model.Exceptions()

  error <- 'todo already exist, duplicate key not allowed'

  # Then
  TRUE |>
    exception[["DuplicateKey"]]() |>
      expect_error(error)
})

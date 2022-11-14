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

test_that("todo.model.exceptions instance has IdIsNull exception",{
    # Given
    exception <- Todo.Model.Exceptions()

    # Then
    exception[["IdIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['IdIsNull']]() should not throw error",{
    # Given
    exception <- Todo.Model.Exceptions()

    # Then
    FALSE |>
        exception[["IdIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['IdIsNull']]() should throw IdIsNull error",{
    # Given
    exception <- Todo.Model.Exceptions()

    error <- 'todo data frame has no Id'

    # Then
    TRUE |>
        exception[["IdIsNull"]]() |>
            expect_error(error)
})

test_that("todo.model.exceptions instance has TaskIsNull exception",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  exception[["TaskIsNull"]] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("FALSE |> exception[['TaskIsNull']]() should not throw error",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  FALSE |>
    exception[["TaskIsNull"]]() |>
      expect_no_error()
})

test_that("TRUE |> exception[['TaskIsNull']]() should throw TaskIsNull error",{
  # Given
  exception <- Todo.Model.Exceptions()

  error <- 'todo data frame has no Task'

  # Then
  TRUE |>
    exception[["TaskIsNull"]]() |>
      expect_error(error)
})

test_that("todo.model.exceptions instance has StatusIsNull exception",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  exception[["StatusIsNull"]]  |>
    is.null()             |>
      expect_equal(FALSE)
})

test_that("FALSE |> exception[['StatusIsNull']]() should not throw error",{
  # Given
  exception <- Todo.Model.Exceptions()

  # Then
  FALSE |>
    exception[["StatusIsNull"]]() |>
      expect_no_error()
})

test_that("TRUE |> exception[['StatusIsNull']]() should throw StatusIsNull error",{
  # Given
  exception <- Todo.Model.Exceptions()

  error <- 'todo data frame has no Status'

  # Then
  TRUE |>
    exception[["StatusIsNull"]]() |>
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
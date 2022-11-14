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
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
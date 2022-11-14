test_that("Todo.Model.Exceptions Exist",{
  Todo.Model.Exceptions |>
    is.null() |>
      expect_equal(FALSE)
})
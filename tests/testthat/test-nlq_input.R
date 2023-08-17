test_that("nlq_input is OK", {
  choices <- letters
  result <- nlq_input("id", choices)
  expect_s3_class(result, "shiny.tag")
})

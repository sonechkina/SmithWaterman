context("Smith-Waterman algorithm testing")

# Test case 1: Wikipedia alignment example (https://en.wikipedia.org/wiki/Smith%E2%80%93Waterman_algorithm#Example)
test_that("smith_waterman returns correct alignment", {
  solution = smith_waterman("TGTTACGG", "GGTTGACTA", match = 3, mismatch = -3, gap = -2)$alseqs
  expected = matrix(c("G", "-", "T", "T", "-", "A", "C", 
                      "G", "G", "T", "T", "G", "A", "C"), byrow = TRUE, nrow =2)
  expect_equal(solution, expected)
})

# Test case 2: error messages
test_that("smith_waterman returns an error message for invalid input scores", {
  expect_error(smith_waterman("TGTTACGG", "GGTTGACTA", match = "a", mismatch = -3, gap = -2))
  expect_error(smith_waterman("TGTTACGG", "GGTTGACTA", match = 3, mismatch = factor("one"), gap = -2))
  expect_error(smith_waterman("TGTTACGG", "GGTTGACTA", match = 3, mismatch = -3, gap = TRUE))
})


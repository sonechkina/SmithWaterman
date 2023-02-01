context("Smith-Waterman algorithm testing")

# Test case: Wikipedia example (https://en.wikipedia.org/wiki/Smith%E2%80%93Waterman_algorithm#Example)
test_that("smith_waterman returns correct alignment", {
  solution = smith_waterman("TGTTACGG", "GGTTGACTA", match = 3, mismatch = -3, gap = -2)$alseqs
  expected = matrix(c("G", "-", "T", "T", "-", "A", "C", 
                      "G", "G", "T", "T", "G", "A", "C"), byrow = TRUE, nrow =2)
  expect_equal(solution, expected)
})

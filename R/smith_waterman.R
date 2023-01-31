#' Smith Waterman algorithm for local pairwise alignment
#'
#' @description
#' 'smith_waterman' takes as arguments two input string sequences and the scores
#' for the match, mismatch and gap, to perform a local pairwise alignment.
#' The result of this function is a list of the two sequences with the optimal
#' alignment between them.
#'
#' @param seq1 The first nucleotide sequence to be passed as a string for
#' alignment. It can be considered as the 'reference' sequence.
#' @param seq2 The second nucleotide sequence to be passed as a string for
#' alignment. It can be considered the 'query' sequence.
#' @param match The cost of a match to be expressed as a numeric value.
#' @param mismatch The cost of a mismatch to be expressed as a numeric value.
#' @param gap The cost of a gap (or indel) to be expressed as a numeric value.
#'
#' @return A list of the two sequences that express the optimal local alignment
#' between the two input sequences.
#' @export
#'
#' @examples
#' smith_waterman("AATCGT", "AAATGC", 1, -1, 0)
#'
smith_waterman <- function(seq1, seq2, match, mismatch, gap) {

  # Check if the scores are numeric types
  if(!is.numeric(match)) stop("Match score must be a a number")
  if(!is.numeric(mismatch)) stop("Mismatch score must be a a number")
  if(!is.numeric(gap)) stop("Gap score must be a a number")

  # Produce a vector with all the characters in the sequences
  seq1_splitted <- unlist(strsplit(seq1, ""))
  seq2_splitted <- unlist(strsplit(seq2, ""))

  # Generating the empty matrices for storing scores and tracing
  cols <- nchar(seq1)
  rows <- nchar(seq2)

  # Scoring matrix
  m <- matrix(0, rows+1, cols+1)
  # Assign names of columns and rows to the score-matrix
  colnames(m) <- c("", seq1_splitted)
  rownames(m) <- c("", seq2_splitted)

  # Tracing matrix
  m_trace <- m

  #----------------------------------------------------------------------------#

  # Smith-Waterman algorithm with local alignments scores in score-matrix

  for (i in 2:nrow(m)){

    for (j in 2:ncol(m)){

      # Calculating the horizontal gap score
      score_left <- m[i,j-1] + gap

      # Calculating the vertical gap score
      score_up <- m[i-1,j] + gap

      # Calculating the diagonal score (match and mismatch score)
      if(colnames(m)[j] == rownames(m)[i]){
        score_diag <- m[i-1,j-1] + match
      } else {
        score_diag <- m[i-1,j-1] + mismatch
      }

      # Taking the highest score
      all_scores <- c(score_left, score_up, score_diag)
      m[i,j] <- max(all_scores)

      # Initializing the tracing matrix from the highest score
      m_trace[i,j] <- which(all_scores == m[i,j])[1]

      # Turning negative values to zeros
      if (m[i,j] < 0) {
        m[i,j] <- 0
      }
    }
  }

  #----------------------------------------------------------------------------#

  ## Initializing the variables for tracing

  # Initialization of aligned sequences
  alseq1 <- c()
  alseq2 <- c()

  # Get the cell (row and column) of the field with maximum value
  max_index <- which(m==max(m), arr.ind = TRUE)[1,]

  # Get the indices of the current field in tracing
  i <- max_index["row"]
  j <- max_index["col"]

  #----------------------------------------------------------------------------#

  ## Traceback part

  while (m[i,j] > 0) {
    direction <- m_trace[i,j]
    switch (direction,
            # Horizontal case: gap in seq2
            {
              j <- j-1
              alseq1 <- c(seq1_splitted[j], alseq1)
              alseq2 <- c("-", alseq2)
            },
            # Vertical case: gap in seq1
            {
              i <- i-1
              alseq1 <- c("-", alseq1)
              alseq2 <- c(seq2_splitted[i], alseq2)
            },
            # Diagonal case: match or mismatch
            {
              i <- i-1; j <- j-1;
              alseq1 <- c(seq1_splitted[j], alseq1)
              alseq2 <- c(seq2_splitted[i], alseq2)
            }
    )
  }

  # Return a list of the two optimally aligned sequences
  return(list(alseq1, alseq2))
}

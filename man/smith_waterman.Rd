% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smith_waterman.R
\name{smith_waterman}
\alias{smith_waterman}
\title{Smith Waterman algorithm for local pairwise alignment}
\usage{
smith_waterman(seq1, seq2, match, mismatch, gap)
}
\arguments{
\item{seq1}{The first nucleotide sequence to be passed as a string for
alignment. It can be considered as the 'reference' sequence.}

\item{seq2}{The second nucleotide sequence to be passed as a string for
alignment. It can be considered the 'query' sequence.}

\item{match}{The cost of a match to be expressed as a numeric value.}

\item{mismatch}{The cost of a mismatch to be expressed as a numeric value.}

\item{gap}{The cost of a gap (or indel) to be expressed as a numeric value.}
}
\value{
A list of the two sequences that express the optimal local alignment
between the two input sequences.
}
\description{
'smith_waterman' takes as arguments two input string sequences and the scores
for the match, mismatch and gap, to perform a local pairwise alignment.
The result of this function is a list of the two sequences with the optimal
alignment between them.
}
\examples{
smith_waterman("AATCGT", "AAATGC", 1, -1, 0)

}

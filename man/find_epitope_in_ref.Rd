% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matcher.R
\name{find_epitope_in_ref}
\alias{find_epitope_in_ref}
\title{Finds the position of the epitope in the reference sequence}
\usage{
find_epitope_in_ref(epitope, query_alignment, alignment_type = "overlap")
}
\arguments{
\item{epitope}{The epitope to find in the sequence. Either a character
string or an AAString}

\item{query_alignment}{The query alignment}

\item{alignment_type}{The type of alignment to try. Defaults to 'overlap'
use 'global' if 'overlap' alignment cannot be found. See Biostrings manual.}
}
\description{
It uses pairwiseAlignment with the default settings. See Biostrings manual.
}
\details{
Lots of things to test and investigate that can potentially improve this
function.
}

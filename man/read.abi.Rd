\name{read.abi}
\alias{read.abi}
\title{Read ABI Output Files}

\description{Read an Applied Biosystems Gene Mapper (ABI) output file,
  and prepare for analysis.

  Note that this operates on the summarised output (a text file), rather
  than the \code{.fsa} files containing data for individual runs.
}

\usage{
read.abi(file)
}

\arguments{
  \item{file}{The name of the file from which the data are to be read.}
}

\details{
  The ABI file format contains a few features that make it difficult to
  interact with directly, so \code{read.abi} provides a wrapper around
  \code{\link{read.table}} to work around these.  The three issues are
  (1) trailing tab characters, (2) mixed case and punctuation in column
  names, and (3) parsing the  \dQuote{Dye/Sample Peak} column.

  Because each line of an ABI file contains a trailing tab character
  (\code{\\t}), \code{\link{read.table}} fails to read the file
  correctly.  \code{read.abi} renames all columns so that
  non-alphanumeric characters all become periods, and all uppercase
  letters are converted to lower case.

  The column \code{Dye/Sample Peak} contains data of the form
  \code{<Dye>,<Sample Peak>}, where \code{<Dye>} is a code for the dye
  colour used and \code{<Sample Peak>} is an integer indicating the
  order of the peaks.  Entries where the contents of \code{Dye/Sample
    Peak} terminates in a \code{"*"} character (indicating an internal
  size standard) are automatically excluded from the analysis.

  The final column names are:
  \itemize{
    \item \code{sample.file.name}: Name of the file containing data.
    \item \code{size}: Size of the peak (in base pairs).
    \item \code{height}: Height of the peak (arbitrary units).
    \item \code{dye}: Code for dye used.
    \item \code{sample.peak}: Rank of peak within current sample.
  }

  In addition, other column names may be retained from ABI output, but
  not used.
}

\note{
  There is no reason that data from other types of output files could
  not be manually imported using \code{TRAMPsamples}.  We welcome
  contributions for other major data formats.
}

\seealso{
  \code{\link{load.abi}}, which attempts to construct a
  \code{TRAMPsamples} object from an ABI file (with a bit of user
  intervention).
}


\keyword{file}
\keyword{connection}

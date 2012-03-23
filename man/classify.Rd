\name{classify}
\alias{classify}

\title{Value Matching for Data Frames}

\description{
  \code{match}-like classification for data.frames; returns a
  vector of row numbers of (first) matches of its first argument in its
  second, across shared column names.  This is unlikely to be useful to
  casual \code{TRAMP} users, but see the final example for a relevant
  usage.
}

\usage{
classify(x, table, ...)
}

\arguments{
  \item{x}{data.frame: containing columns with the values to be
    matched.}
  \item{table}{data.frame: where all columns contain the values to be
    matched against.}
  \item{...}{Additional arguments to \code{\link{match}} (see especially
    \code{nomatch}).}
}

\details{
  As with \code{\link{duplicated.data.frame}}, this works by pasting
  together a character representation of the rows separated by
  \code{\\r} (a carriage return), so may be imperfect if the data.frame
  has characters with embedded carriage returns or columns which do not
  reliably map to characters.

  Cases in \code{x} with \code{NA} values in any column shared with
  \code{table} will not be matched (and will return the value of
  \code{nomatch}).  Cases in \code{table} with any \code{NA} values in
  any row will match nothing.

  All columns in \code{table} must be present in \code{x}, but \code{x}
  may have additional columns that will be ignored.
}

\value{
  A vector of length \code{nrow(x)}, with each element giving the row
  number in \code{table} where all elements match across shared
  columns.
}

\seealso{\code{\link{match}}, on which this is based.}

\examples{
table <- data.frame(a=letters[1:3], b=rep(1:2, each=3))
x <- cbind(table[sample(nrow(table), 20, TRUE),], x=runif(20))

classify(x, table)
all.equal(table[classify(x, table),], x[names(table)])

## Select only a few cases from a TRAMPsamples data object,
## corresponding with 4 enzyme/primer combinations.
data(demo.samples)
d <- demo.samples$data
use <- expand.grid(primer=c("ITS1F", "ITS4"),
                   enzyme=c("HpyCH4IV", "BsuRI"))
classify(d, use)
d[!is.na(classify(d, use)),]
}

\keyword{utilities}
\keyword{manip}
\keyword{logic}
\keyword{internal}

\name{TRAMPindexing}
\alias{TRAMPindexing}
\alias{[.TRAMPknowns}
\alias{[.TRAMPsamples}

\title{Index (Subset) TRAMPsamples and TRAMPknowns Objects}

\description{This provides very basic support for subsetting
  \code{\link{TRAMPsamples}} and \code{\link{TRAMPknowns}} objects.
}

% x[i, na.interp=TRUE, ...]
\usage{
\method{[}{TRAMPknowns}(x, i, na.interp=TRUE, ...)
\method{[}{TRAMPsamples}(x, i, na.interp=TRUE, ...)
}

\arguments{
  \item{x}{A \code{\link{TRAMPsamples}} or \code{\link{TRAMPknowns}}
    object.}
  \item{i}{A vector of \code{sample.fk} or \code{knowns.fk} values.  For
    valid values, use \code{labels(x)}.  If any index values are not
    present in \code{x}, then an error will be raised.  Alternatively,
    this may be a logical vector, of the same length as the number of
    samples or knowns in \code{x}.  See Examples for use of this.
  }
  \item{na.interp}{Logical: Controls how \code{NA} values should be
    interpreted when \code{i} is a logical vector.}
  \item{...}{Further arguments passed to or from other methods.}
}

\details{
  When indexing by logical vectors, \code{NA} values do not make valid
  indexes, but may be produced when testing columns that contain missing
  values, so these must be converted to either \code{TRUE} or
  \code{FALSE}. If \code{i} is a logical index that contains missing
  values (\code{NA}s), then \code{na.interp} controls how they will be
  interpreted:
  \itemize{
    \item If \code{na.interp=TRUE}, then
    \code{TRUE, FALSE, NA} becomes \code{TRUE, FALSE, TRUE}.
    \item If \code{na.interp=FALSE}, then
    \code{TRUE, FALSE, NA} becomes \code{TRUE, FALSE, FALSE}.
  }
}

\section{Warning}{
  For \code{TRAMPknowns} objects, if the \code{file.pat} element is
  specified as part of the object (see \code{\link{TRAMPknowns}}), then
  the subsetted \code{TRAMPknowns} object will be written to a file.
  This may not be what you want, so it is probably best to disable
  knowns writing by doing \code{x$file.pat <- NULL} before doing any
  subsetting (where \code{x} is the name of your \code{TRAMPknowns}
  object).
}

%% TODO: Depending on the final setup of the data, show how logical
%% indexing deals with missing values (this requires the existance of a
%% character vector with some missing values really).
\examples{
data(demo.samples)
data(demo.knowns)

## Subsetting by sample.fk values
labels(demo.samples)
demo.samples[c(101, 102, 110)]
labels(demo.samples[c(101, 102, 110)])

## Take just samples from the first 10 soilcores:
demo.samples[demo.samples$info$soilcore.fk <= 10]

## Indexing also works on TRAMPknowns:
demo.knowns[733]
labels(demo.knowns[733])
}

\keyword{array}
\keyword{methods}

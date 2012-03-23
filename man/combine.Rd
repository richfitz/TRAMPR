\name{combine}
\alias{combine}

\title{Combine Two Objects}

\description{
  This function is used to combine \code{\link{TRAMPsamples}} together,
  and to combine \code{\link{TRAMPknowns}} to \code{\link{TRAMPknowns}}
  or \code{\link{TRAMP}} objects.  \code{combine} is generic; please see
  \code{\link{combine.TRAMPsamples}} and
  \code{\link{combine.TRAMPknowns}} for more information.
}


\usage{
combine(x, y, ...)
}

\arguments{
  \item{x, y}{Objects to be combined.  See
    \code{\link{combine.TRAMPsamples}} and
    \code{\link{combine.TRAMPknowns}} for more information.}
  \item{...}{Additional arguments required by methods.}
}

\seealso{
  See \code{\link{combine.TRAMPsamples}} and
  \code{\link{combine.TRAMPknowns}} for more information.
}

\keyword{methods}

\name{rebuild.TRAMP}
\alias{rebuild.TRAMP}

\title{Rebuild a TRAMP Object}
\description{
  This function rebuilds a \code{TRAMP} object.  Typically this will be
  called automatically after adding knowns (see
  \code{\link{add.known}}); there should be little need to call this
  manually.   The same parameters that were used in the
  original call to \code{\link{TRAMP}} are used again, and these cannot
  currently be modified during this call.
}


\usage{rebuild.TRAMP(x)}
\arguments{
  \item{x}{A \code{TRAMP} object.}
}

\value{A new \code{TRAMP} object, with all components recalculated.}

\keyword{multivariate}
\keyword{cluster}

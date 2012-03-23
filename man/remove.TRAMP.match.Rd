\name{remove.TRAMP.match}
\alias{remove.TRAMP.match}
\title{Mark a TRAMP Match as Ignored}

\description{Mark a match in a TRAMP object as ignored; when this is
  set, a match will be ignored when producing presence/absence matrices
  (see \code{\link{summary.TRAMP}}) or when plotting
  (\code{\link{plot.TRAMP}}) when \code{ignore} is \code{TRUE}.
  \code{\link{update.TRAMP}} provides an interactive interface for doing
  this, but \code{remove.TRAMP.match} may be useful directly.
}

\usage{
remove.TRAMP.match(x, sample.fk, knowns.fk)
}

\arguments{
  \item{x}{A \code{TRAMP} object.}
  \item{sample.fk, knowns.fk}{Key of sample and known, respectively.
    See \code{\link{TRAMPsamples}} and \code{\link{TRAMPknowns}} for
    more information.}
}

\value{A modified \code{TRAMP} object.}

\note{
  This function returns a modified object - the \code{TRAMP} object is
  not modified in place.  You must do:

  \code{x <- remove.TRAMP.match(x, sample.fk, knowns.fk)}

  to mark a match as ignored in the object \code{x}.
}

\section{Warning}{
  This should be regarded as experimental.  There is currently no
  mechanism for restoring ignored matches, aside from recreating the
  \code{TRAMP} object, or through editing \code{x$presence.ign} directly
  (the format of that table is self-explanatory, but is not guaranteed
  not to change between TRAMP versions).  Note that by default,
  \code{\link{summary.TRAMP}} and \code{\link{plot.TRAMP}} will not
  remove matches; you must specify \code{ignore=TRUE} to enable this.
}

\keyword{manip}

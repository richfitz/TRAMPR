\name{update.TRAMP}
\alias{update.TRAMP}

\title{Interactively Alter a TRAMP Object}

\description{This function allows some manual checking and correction of
  a \code{\link{TRAMP}} object.  By default, it steps through each
  sample, and offers to (1) add a new known to the
  \code{\link{TRAMPknowns}} database within the \code{TRAMP} object (see
  \code{\link{add.known}} for details), (2) mark matches to be ignored
  in future calls to \code{\link{plot.TRAMP}} (see
  \code{\link{remove.TRAMP.match}}), (3) save the current plot as a
  PDF.
}

\usage{
\method{update}{TRAMP}(object, sample.fk=labels(object$samples), grouped=FALSE,
       ignore=TRUE, delay.rebuild=FALSE, default.species=NULL,
       filename.fmt="TRAMP_\%d.pdf", ...)
}

\arguments{
  \item{object}{A \code{TRAMP} object.}
  \item{sample.fk}{A vector of \code{sample.fk} to cycle through.  If
    omitted, this will default to all samples present in the
    \code{\link{TRAMPsamples}} component of the \code{TRAMP} object.}
  \item{grouped, ignore}{Plotting parameters, as in
    \code{\link{plot.TRAMP}}.  Currently these cannot be altered from
    their default values.}
  \item{delay.rebuild}{Logical: Should the rebuild of the \code{TRAMP}
    object be delayed until the function returns?  If this is
    \code{FALSE} (the default), then the \code{TRAMP} object will
    rebuild every time a new known is added.  This may take a while for
    large objects, so if set to \code{TRUE}, then the \code{TRAMP}
    object will not be rebuilt until all \code{sample.fk}s have been
    displayed.  This means that any new samples added as knowns will not
    be included in plots.}
  \item{default.species}{Default species name for newly added knowns.
    Passed to \code{\link{add.known}}.}
  \item{filename.fmt}{Format used to generate filenames when saving
    PDFs.  Include a \code{"\%d"} to stand in for the \code{sample.fk}
    (so \code{"TRAMP_\%d.pdf"} becomes \code{"TRAMP_12.pdf"} for
    \code{sample.fk} 12).}
  \item{...}{Further arguments passed to the plotting function
    \code{\link{plot.TRAMP}}.}
}

\note{
  \code{update.TRAMP} returns a modified \code{TRAMP} object, and does
  not modify the original \code{TRAMP} object in place.  You must use it
  like:

  \code{x <- update(x)}

  or

  \code{x2 <- update(x)}

  to modify the original object or create a new, modified object in
  place.  Note that if creating mutiple objects, if the
  \code{\link{TRAMPknowns}} object has a \code{file.pat} element, then
  any changes to either of \code{x} or \code{x2} will be written back to
  file, but the knowns contained in \code{x} and \code{x2} may be
  different.  See the note in \code{\link{add.known}}.

  The action \dQuote{Quit} will always exit the \code{update} function and
  save the object.

  Be careful when using a \code{TRAMP} object whose \code{TRAMPknowns}
  element has a \code{file.pat} element; new knowns added will be
  immediately written to file.
}

\section{Warning}{
  If an error occurs while running \code{update}, all modifications will
  be lost.
}

\examples{
## Since this function runs interactively, there can be no sample.
}

\keyword{multivariate}
\keyword{cluster}

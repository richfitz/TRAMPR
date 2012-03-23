\name{combine.TRAMPsamples}
\alias{combine.TRAMPsamples}

\title{Combine TRAMPsamples Objects}

\description{Combines two \code{\link{TRAMPsamples}} objects into one
  large \code{TRAMPsamples} object containing all the samples for both
  original objects.}

\usage{
\method{combine}{TRAMPsamples}(x, y, rewrite.sample.pk=FALSE, ...)
}

\arguments{
  \item{x, y}{\code{\link{TRAMPsamples}} objects, containing TRFLP
    patterns.}
  \item{rewrite.sample.pk}{Logical: If the new sample data (\code{y})
    contains \code{sample.pk} values that conflict with those in the
    original \code{TRAMPsamples} object (\code{x}), should the new samples
    be renumbered?  If this is \code{TRUE}, do not rely on \emph{any}
    \code{sample.pk} values staying the same for the newly added samples.
    \code{sample.pk} values in the original \code{TRAMPsamples} object
    will never be changed.}
  \item{...}{Further arguments passed to or from other methods.}
}

\details{
  For a discussion of \code{rewrite.sample.pk}, see the comments on
  \code{rewrite.knowns.pk} in the Details of
  \code{\link{combine.TRAMPknowns}}.

  The \code{data} and \code{info} elements of the resulting
  \code{TRAMPsamples} object will have union of the columns present in
  both sets of samples.

  If any additional elements exist as part of the second
  \code{TRAMPsamples} object (e.g. passed as \code{...} to
  \code{\link{TRAMPsamples}}), these will be ignored with a warning (see
  Example).
}

\seealso{\code{\link{combine.TRAMPknowns}}, the method for
  \code{\link{TRAMPknowns}} objects.}

\examples{
data(demo.samples)

## Let's split the original samples database in two, and recombine.
demo.samples.a <- demo.samples[head(labels(demo.samples), 10)]
demo.samples.b <- demo.samples[tail(labels(demo.samples), 10)]

## Combining these is easy:
demo.samples.c <- combine.TRAMPsamples(demo.samples.a, demo.samples.b)

## There is a warning message because demo.samples.b contains extra
## elements:
names(demo.samples.b)

## In this case, these objects should not be combined, but in other
## cases it may be necessary to rbind() the extra objects together:
\dontrun{
demo.samples.c$soilcore <- rbind(demo.samples.a$soilcore,
                                 demo.samples.b$soilcore)
}

## This must be done manually, since there is no way of telling what
## should be done automatically.  Ideas/contributions are welcome here.
}

\keyword{manip}

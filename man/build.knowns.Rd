\name{build.knowns}
\alias{build.knowns}

\title{Automatically Build Knowns Database}

\description{
  This function uses several filters to select likely knowns, and
  construct a \code{\link{TRAMPknowns}} object from a
  \code{\link{TRAMPsamples}} object.  Samples are considered to be
  \dQuote{potential knowns} if they have data for an adequate number of
  enzyme/primer combinations, and if for each combination they have
  either a single peak, or a peak that is \dQuote{distinct enough} from
  any other peaks.
}

\usage{
build.knowns(d, min.ratio=3, min.comb=NA, restrict=FALSE, ...)
}

\arguments{
  \item{d}{A \code{TRAMPsamples} object, containing samples from which
    to build the knowns database.}
  \item{min.ratio}{Minimum ratio of maximum to second highest peak to
    accept known (see Details).}
  \item{min.comb}{Minimum number of enzyme/primer combinations required
    for each known (see Details for behaviour of default).}
  \item{restrict}{Logical: Use only cases where \code{d$info$species} is
    non-blank?  (These are assumed to come from samples of a known
    species.  However, it is not guaranteed that all samples with data for
    \code{species} will become knowns; if they fail either the
    \code{min.ratio} or \code{min.comb} checks they will be excluded.)}
  \item{...}{Additional arguments passed to \code{\link{TRAMPknowns}}
    (e.g. \code{cluster.pars}, \code{file.pat} and any additional
    objects).}
}

\details{
  For all samples and enzyme/primer combinations, the ratio of the
  largest to the second largest peak is calculated.  If it is greater
  than \code{min.ratio}, then that combination is accepted.  If the
  sample has at least \code{min.comb} valid enzyme/primer combinations,
  then that sample is included in the knowns database.  If
  \code{min.comb} is \code{NA} (the default), then \emph{every}
  enzyme/primer combination present in the data is required.
}

\value{
  A new \code{TRAMPknowns} object.  It will generally be neccessary to
  edit this object; see \code{\link{read.TRAMPknowns}} for details on
  how to write, edit, and read back a modified object.
}

\note{
  If two peaks have the same height, then using \code{min.ratio=1} will
  not allow the entry as part of the knowns database; use
  \code{min.ratio=0} instead if this is desired.  In this case, the peak
  chosen is unspecified.

  Note that this function is sensitive to data quality.  In particular
  split peaks may cause a sample not to be added.  These samples may be
  manually added using \code{\link{add.known}}.
}

\examples{
data(demo.samples)
demo.knowns.auto <- build.knowns(demo.samples, min.comb=4)
plot(demo.knowns.auto, cex=.75)
}

\keyword{multivariate}
\keyword{cluster}
\keyword{datagen}

\name{summary.TRAMP}
\alias{summary.TRAMP}

\title{Create Presence/Absence Matrices from TRAMP Objects}
\description{Generate a summary of a \code{TRAMP} object, by producing a
  presence/absence matrix.  This is the preferred way of extracting the
  presence/absence matrix from a  \code{TRAMP} object, and allows for
  grouping, naming knowns, and ignoring matches (specified by
  \code{\link{remove.TRAMP.match}}).
}

\usage{
\method{summary}{TRAMP}(object, name=FALSE, grouped=FALSE, ignore=FALSE, ...)
}

\arguments{
  \item{object}{A \code{TRAMP} object.}
  \item{name}{Logical: Should the knowns be named?}
  \item{grouped}{Logical: Should the knowns be grouped?}
  \item{ignore}{Logical: Should matches marked as ignored be excluded?}
  \item{...}{Further arguments passed to or from other methods.}
}

\value{
  A presence/absence matrix, with samples as rows
  and knowns as columns.  If \code{name} is \code{TRUE}, then names of
  knowns (or groups of knowns) are used, otherwise the \code{knowns.fk}
  is used (\code{group.strict} if grouped).  If \code{grouped} is
  \code{TRUE}, then the knowns are collapsed by group (using
  \code{group.strict}; see \code{\link{group.knowns}}).  A group is
  present if \emph{any} of the knowns belonging to it are present.  If
  \code{ignore} is \code{TRUE}, then any matches marked by
  \code{\link{remove.TRAMP.match}} are excluded.
}

\examples{
data(demo.knowns)
data(demo.samples)
res <- TRAMP(demo.samples, demo.knowns)

head(summary(res))
head(summary(res, name=TRUE))
head(summary(res, name=TRUE, grouped=TRUE))

## Extract the species richness for each sample (i.e. the number of
## knowns present in each sample)
rowSums(summary(res, grouped=TRUE))

## Extract species frequencies and plot a rank abundance diagram:
## (i.e. the number of times each known was recorded)
sp.freq <- colSums(summary(res, name=TRUE, grouped=TRUE))

sp.freq <- sort(sp.freq[sp.freq > 0], decreasing=TRUE)
plot(sp.freq, xlab="Species rank", ylab="Species frequency", log="y")
text(1:2, sp.freq[1:2], names(sp.freq[1:2]), cex=.7, pos=4, font=3)
}

\keyword{methods}

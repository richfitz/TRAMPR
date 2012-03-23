\name{create.diffsmatrix}
\alias{create.diffsmatrix}

\title{Calculate Matrix of Distances between Peaks}

\description{
  Generate an array of goodness-of-fit (or distance) between samples and
  knowns based on the sizes (in base pairs) of TRFLP peaks.  For each
  sample/known combination, and for each enzyme/primer combination, this
  calculates the minimum distance between any peak in the sample and the
  single peak in the known.
}

\usage{
create.diffsmatrix(samples, knowns)
}

\arguments{
  \item{samples}{A \code{\link{TRAMPsamples}} object, containing
    unidentified samples.}
  \item{knowns}{A \code{\link{TRAMPknowns}} object, containing
    identified TRFLP patterns.}
}

\details{
  This function will rarely need to be called directly, but does most of
  the calculations behind \code{\link{TRAMP}}, so it is useful to
  understand how this works.

  This function generates a three-dimensional \eqn{s \times k \times
    n}{s x k x n} matrix of the (smallest, see below) distance in base
  pairs between peaks in a collection of unknowns (run data) and a
  database of knowns for several enzyme/primer combinations.  \eqn{s} is
  the number of different samples in the samples data
  (\code{length(labels(samples))}), \eqn{k} is the number of different
  types in the knowns database (\code{length(labels(knowns))}), and
  \eqn{n} is the number of different enzyme/primer combinations.  The
  enzyme/primer combinations used are all combinations present in the
  knowns database; combinations present only in the samples will be
  ignored.  Not all samples need contain all enzyme/primer combinations
  present in the knowns.

  In the resulting array, \code{m[i,j,k]} is the difference (in base
  pairs) between the \code{i}th sample and the \code{j}th known for the
  \code{k}th enzyme/primer combination.  The ordering of the \eqn{n}
  enzyme/primer combinations is arbitrary, so a data.frame of
  combinations is included as the attribute \code{enzyme.primer}, where
  \code{enzyme.primer$enzyme[k]} and \code{enzyme.primer$primer[k]}
  correspond to enzyme and primer used for the distances in
  \code{m[,,k]}.

  Each case in the knowns database has a single (or no) peak for each
  enzyme/primer combination, but each sample may contain multiple peaks
  for an enzyme/primer combination; the difference is always the
  smallest distance from the sample to the known peak.  Where a sample
  and/or a known lacks an enzyme/primer combination, the value of the
  difference is \code{NA}.  The smallest \emph{absolute} distance is
  taken between sample and known peaks, but the sign of the difference
  is preserved (negative where the closest sample peak was less than the
  known peak, positive where greater; see \code{\link{absolute.min}}).
}

\value{
  A three-dimensional matrix, with an attribute \code{enzyme.primer},
  described above.
}

\seealso{
  \code{\link{TRAMP}}, which uses output from
  \code{create.diffsmatrix}.
}

\examples{
data(demo.samples)
data(demo.knowns)

s <- length(labels(demo.samples))
k <- length(labels(demo.knowns))
n <- nrow(unique(demo.knowns$data[c("enzyme", "primer")]))

m <- create.diffsmatrix(demo.samples, demo.knowns)

dim(m)
identical(dim(m), c(s, k, n))

## Maximum error for each sample/known (i.e. across all enzyme/primer
## combinations), similar to how calculated by \link{TRAMP}
error <- apply(abs(m), 1:2, max, na.rm=TRUE)
dim(error)

## Euclidian error (see ?\link{TRAMP})
error.euclid <- sqrt(rowSums(m^2, TRUE, 2))/rowSums(!is.na(m), dims=2)

## Euclidian and maximum error will require different values of
## accept.error in TRAMP:
plot(error, error.euclid, pch=".")
}

\keyword{multivariate}
\keyword{cluster}

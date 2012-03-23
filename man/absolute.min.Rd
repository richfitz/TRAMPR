\name{absolute.min}
\alias{absolute.min}
\title{Absolute Minimum}

\description{Returns the signed value of the element with the minimum
  absolute value in a vector.}

\usage{
absolute.min(x)
}

\arguments{
  \item{x}{Numeric vector (\code{NA}s are allowed)}
}

\value{
  A single value; the value with the smallest absolute value, but with
  its original sign.  This is equivalent to (and implemented as)
  \code{x[which.min(abs(x))]}

  The value is \code{NA} if \code{x} has no non-\code{NA} values
  (c.f. \code{\link{which.min}}).
}

\examples{
set.seed(1)
x <- rnorm(16)
min(x)          # -2.2147
min(abs(x))     #  0.0444
absolute.min(x) # -0.0444: preserves sign

# NA values OK:
absolute.min(c(-1, 4, NA))

# Slightly unintuitive behaviour:
absolute.min(numeric(0)) # numeric(0)
absolute.min(NA)         # NA
}

\keyword{utilities}
\keyword{internal}
\keyword{univar}
\keyword{arith}

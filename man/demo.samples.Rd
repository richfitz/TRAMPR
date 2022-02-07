\name{demo.samples}
\docType{data}
\alias{demo.samples}
\title{Demonstration Samples Database}

\description{
  A samples database, for demonstrating the \code{TRAMPR} package.
  This is a subset of a full samples database, is not intended to
  represent any real data set, and should not be assumed to be
  accurate.

  The data are stored as a \code{\link{TRAMPsamples}} object.  Columns in
  the \code{info} and \code{data} components are described on the
  \code{\link{TRAMPsamples}} page, but with some additions:
  \itemize{
    \item \code{info}:
    \itemize{
      \item \code{soilcore.fk}: Key to the soil core from which a
      sample came.  See \code{soilcore}, below.
    }
    \item \code{data}:
    \itemize{
      \item \code{sample.file.name}: Original \code{.fsa} file
      corresponding to the TRFLP run.  This is included in all
      \code{TRAMPsamples} objects created by \code{\link{load.abi}}.
    }
    \item \code{soilcore}: A \code{data.frame} with information about
    the soilcore from which samples came.
    \itemize{
      \item \code{soilcore.pk}: Key, distinguishing soil cores.
      \item \code{plot}: Plot number (1 to 10).
      \item \code{elevation}: Height above mean sea level, in metres.
      \item \code{east}: Easting (New Zealand Map Grid/NZMG).
      \item \code{north}: Northing (NZMG).
      \item \code{vegetation}: Vegetation type (\code{Nothofagus
	solandri} or \code{Pinus contorta}).
    }
  }
}
\usage{data(demo.samples)}

\format{A \code{\link{TRAMPsamples}} object.}

\section{Licence}{This data set is provided under a Creative Commons
  \dQuote{Attribution-NonCommercial-NoDerivs 2.5} licence.  Please see
  \url{https://creativecommons.org/licenses/by-nc-nd/2.5/} for details.
}

\keyword{datasets}

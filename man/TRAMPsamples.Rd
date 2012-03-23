\name{TRAMPsamples}
\alias{TRAMPsamples}
\alias{labels.TRAMPsamples}
\alias{summary.TRAMPsamples}

\title{TRAMPsamples Objects}

\description{These functions create and interact with
  \code{TRAMPsamples} objects (collections of TRFLP patterns).  Samples
  contrast with \dQuote{knowns} (see \code{\link{TRAMPknowns}}) in that
  samples contain primarily unidentified profiles.  In contrast with
  knowns, samples may have many peaks per enzyme/primer combination.
}

\usage{
TRAMPsamples(data, info=NULL, warn.factors=TRUE, ...)

\method{labels}{TRAMPsamples}(object, ...)
\method{summary}{TRAMPsamples}(object, include.info=FALSE, ...)
}

\arguments{
  \item{data}{data.frame containing peak information.}
  \item{info}{(Optional) data.frame, describing individual samples (see
    Details for definitions of both data.frames).  If this is omitted,
    a basic data.frame will be generated.}
  \item{warn.factors}{Logical: Should a warning be given if any columns
    in \code{info} or \code{data} are converted into factors?}
  \item{object}{A \code{TRAMPsamples} object.}
  \item{include.info}{Logical: Should the output be augmented with the
    contents of the \code{info} component of the \code{TRAMPsamples}
    object?}
  \item{...}{\code{TRAMPsamples}: Additional objects to incorportate
    into a \code{TRAMPsamples} object.  Other methods: Further arguments
    passed to or from other methods.}
}

\details{
  The object has at least two components, which relate to each other (in
  the sense of a relational database). \code{info} holds information
  about the individual samples, and \code{data} holds information about
  individual peaks (many of which belong to a single sample).

  Column definitions:
  \itemize{
    \item \code{info}:
    \describe{
      \item{\code{sample.pk}}{Unique positive integer, used to identify
	individual samples (i.e. a \dQuote{primary key}).}
      \item{\code{species}}{Character, giving species name if samples
	were collected from an identified species.  If this column is
	missing, it will be initialised as \code{NA}.}
    }
    \item \code{data}:
    \describe{
      \item{\code{sample.fk}}{Positive integer, indicating which sample
	the peak belongs to (by matching against \code{info$sample.pk})
	(i.e. a \dQuote{foreign key}).}
      \item{\code{primer}:}{Character, giving the name of the primer
	used.}
      \item{\code{enzyme}:}{Character, giving the name of the
	restriction digest enzyme used.}
      \item{\code{size}}{Numeric, giving size (in base pairs) of the
	peak.}
      \item{\code{height}}{Numeric, giving the height (arbitrary units)
	of the peak.}
    }
  }

  Additional columns are allowed (and ignored) in both data.frames, and
  will be retained.  This allows notes on data quality and treatments to
  be easily included.  Additional objects are allowed as part of the
  \code{TRAMPsamples} object; any extra objects passed (via
  \code{...}) will be included in the final \code{TRAMPsamples} object.

  If \code{info} is omitted, then a basic data.frame will be generated,
  containing just the unique values of \code{sample.fk}, and
  \code{NA} for \code{species}.
}

\value{
  \item{TRAMPsamples}{A new \code{TRAMPsamples} object, as described
    above.}
  \item{labels.TRAMPsamples}{A sorted vector of the unique samples
    present in \code{x} (from \code{info$sample.pk}).}
  \item{summary.TRAMPsamples}{A data.frame, with the number of peaks
    per enzyme/primer combination, with each sample (indicated by
    \code{sample.pk}) as rows and each combination (in the format
    \code{<primer>_<enzyme>}) as columns.}
}

\note{
  Across a \code{TRAMPsamples} object, primer and enzyme names must be
  \emph{exactly} the same (including case and whitespace) to be
  considered the same.  For example \code{"ITS4"}, \code{"Its4"},
  \code{"ITS4 "} and \code{"ITS 4"} would be considered to be four
  different primers.

  Factors will not merge correctly (with
  \code{\link{combine.TRAMPsamples}}).  \code{TRAMPsamples} will attempt
  to catch factor columns and convert them into characters for the
  \code{info} and \code{data} data.frames.  Other objects (passed as
  part of \code{...}) will not be altered.
}

\seealso{
  \code{\link{plot.TRAMPsamples}} and
  \code{\link{summary.TRAMPsamples}}, for plotting and summarising
  \code{TRAMPsamples} objects.

  \code{\link{TRAMPknowns}}, which constructs an analagous object to
  hold \dQuote{knowns} data.

  \code{\link{TRAMP}}, for analysing \code{\link{TRAMPsamples}}
  objects.

  \code{\link{load.abi}}, which creates a \code{TRAMPsamples} object
  from Gene Mapper (Applied Biosystems) output.
}

\keyword{classes}

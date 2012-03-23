\name{TRAMPknowns}
\alias{TRAMPknowns}
\alias{labels.TRAMPknowns}
\alias{summary.TRAMPknowns}

\title{TRAMPknowns Objects}

\description{These functions create and interact with
  \code{TRAMPknowns} objects (collections of known TRFLP
  patterns).  Knowns contrast with \dQuote{samples} (see
  \code{\link{TRAMPsamples}}) in that knowns contain identified
  profiles, while samples contain unidentified profiles.  Knows must
  have at most one peak per enzyme/primer combination (see Details).
}

\usage{
TRAMPknowns(data, info, cluster.pars=list(), file.pat=NULL,
            warn.factors=TRUE, ...)


\method{labels}{TRAMPknowns}(object, ...)
\method{summary}{TRAMPknowns}(object, include.info=FALSE, ...)
}

\arguments{
  \item{data}{data.frame containing peak information.}
  \item{info}{data.frame, describing individual samples (see Details for
    definitions of both data.frames).}
  \item{cluster.pars}{Parameters used when clustering the knowns
    database.  See Details.}
  \item{file.pat}{Optional partial filename in which to store knowns
    database after modification.  Files \code{<file.pat>_info.csv}
    and \code{<file.pat>_data.csv} will be created.}
  \item{warn.factors}{Logical: Should a warning be given if any columns
    in \code{info} or \code{data} are converted into factors?}
  \item{object}{A \code{TRAMPknowns} object.}
  \item{include.info}{Logical: Should the output be augmented with the
    contents of the \code{info} component of the \code{TRAMPknowns}
    object?}
  \item{...}{\code{TRAMPknowns}: Additional objects to incorportate
    into a \code{TRAMPknowns} object.  Other methods: Further arguments
    passed to or from other methods.}
}

\details{
  The object has at least two components, which relate to each other (in
  the sense of a relational database).  \code{info} holds information
  about the individual samples, and \code{data} holds information about
  individual peaks (many of which may belong to a single sample).

  Column definitions:
  \itemize{
    \item \code{info}:
    \describe{
      \item{\code{knowns.pk}:}{Unique positive integer, used to identify
	individual knowns (i.e. a \dQuote{primary key}).}
      \item{\code{species}:}{Character, giving species name.}
    }
    \item \code{data}:
    \describe{
      \item{\code{knowns.fk}:}{Positive integer, indicating which sample
	the peak belongs to (by matching against \code{info$knowns.pk})
	(i.e. a \dQuote{foreign key}).}
      \item{\code{primer}:}{Character, giving the name of the primer
	used.}
      \item{\code{enzyme}:}{Character, giving the name of the
	restriction digest enzyme used.}
      \item{\code{size}:}{Numeric, giving size (in base pairs) of the
	peak.}
    }
  }

  In addition, \code{TRAMPknowns} will create additional columns holding
  clustering information (see \code{\link{group.knowns}}).  Additional
  columns are allowed (and retained, but ignored) in both data.frames.
  Additional objects are allowed as part of the \code{TRAMPknowns}
  object, but these will not be written by
  \code{\link{write.TRAMPknowns}}; any extra objects passed (via
  \code{...}) will be included in the final \code{TRAMPknowns} object.

  The \code{cluster.pars} argument controls how knowns will be clustered
  (this will happen automatically as needed).  Elements of the list
  \code{cluster.pars} may be any of the three arguments to
  \code{\link{group.knowns}}, and will be used as defaults in
  subsequent calls to \code{group.knowns}.  If not provided, default
  values are: \code{dist.method="maximum"},
  \code{hclust.method="complete"}, \code{cut.height=2.5} (if only some
  elements of \code{cluster.pars} are provided, the remaining elements
  default to the values above).  To change values of clustering
  parameters in an existing \code{TRAMPknowns} object, use
  \code{\link{group.knowns}}.

  A known contains at most one peak per enzyme/primer combination.
  Where a species is known to have multiple TRFLP profiles, these should
  be treated as separate knowns with different, unique, \code{knowns.pk}
  values, but with identical \code{species} values.  A sample containing
  either pattern will then be recorded as having that species present
  (see \code{\link{group.knowns}}).
}

\value{
  \item{TRAMPknowns}{A new \code{TRAMPknowns} object: a list with
    components \code{info}, \code{data} (the provided data.frames, with
    clustering information added to \code{info}), \code{cluster.pars}
    and \code{file.pat}, plus any extra objects passed as \code{...}.}
  \item{labels.TRAMPknowns}{A sorted vector of the unique samples
    present in \code{x} (from \code{info$knowns.pk}).}
  \item{summary.TRAMPknowns}{A data.frame, with the size of the peak (if
    present) for each enzyme/primer combination, with each known
    (indicated by \code{knowns.pk}) as rows and each combination (in the
    format \code{<primer>_<enzyme>}) as columns.}
}

\note{
  Across a \code{TRAMPknowns} object, primer and enzyme names must be
  \emph{exactly} the same (including case and whitespace) to be
  considered the same.  For example \code{"ITS4"}, \code{"Its4"},
  \code{"ITS 4"} and \code{"ITS4 "} would be considered to be four
  different primers.

  Factors will not merge correctly (with
  \code{\link{combine.TRAMPknowns}} or \code{\link{add.known}}).
  \code{TRAMPknowns} will attempt to catch factor columns and convert
  them into characters for the \code{info} and \code{data} data.frames.
  Other objects (passed as part of \code{...}) will not be altered.
}

\seealso{
  \code{\link{TRAMPsamples}}, which constructs an analagous object to
  hold \dQuote{samples} data.

  \code{\link{plot.TRAMPknowns}}, which creates a graphical
  representation of the knowns data.

  \code{\link{TRAMP}}, for matching unknown TRFLP patterns to
  \code{TRAMPknowns} objects.

  \code{\link{group.knowns}}, which groups similar knowns (generally
  called automatically).

  \code{\link{add.known}} and \code{\link{combine.TRAMPknowns}}, which
  provide tools for adding knowns from a sample data set and merging
  knowns databases.
}

\examples{
## This example builds a TRAMPknowns object from completely artificial
## data:

## The info data.frame:
knowns.info <-
  data.frame(knowns.pk=1:8,
             species=rep(paste("Species", letters[1:5]), length=8))
knowns.info

## The data data.frame:
knowns.data <- expand.grid(knowns.fk=1:8,
                           primer=c("ITS1F", "ITS4"),
                           enzyme=c("BsuRI", "HpyCH4IV"))
knowns.data$size <- runif(nrow(knowns.data), min=40, max=800)

## Construct the TRAMPknowns object:
demo.knowns <- TRAMPknowns(knowns.data, knowns.info, warn.factors=FALSE)

## A plot of the pretend knowns:
plot(demo.knowns, cex=1, group.clusters=TRUE)
}

\keyword{classes}

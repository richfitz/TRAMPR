\name{add.known}
\alias{add.known}
\alias{add.known.TRAMP}
\alias{add.known.TRAMPknowns}
\alias{combine.TRAMP}
\alias{combine.TRAMPknowns}

\title{Add Knowns To TRAMPknowns Databases}

\description{Add a single known or many knowns to a knowns database in a
  \code{\link{TRAMPknowns}} object.  \code{add.known} takes a
  \code{\link{TRAMPknowns}} object, and adds the peak profile of a
  single sample from a \code{\link{TRAMPsamples}} object.
  \code{combine.TRAMPknowns} combines two \code{\link{TRAMPknowns}}
  objects (similar to \code{\link{combine.TRAMPsamples}}).
  \code{add.known} and \code{combine} are generic, so if \code{x}
  argument is a \code{\link{TRAMP}} object, then the \code{knowns}
  component of that object will be updated.
}

\usage{
add.known(x, ...)
\method{add.known}{TRAMPknowns}(x, samples, sample.fk, prompt=TRUE, default.species=NULL, ...)
\method{add.known}{TRAMP}(x, sample.fk, rebuild=TRUE, ...)

\method{combine}{TRAMPknowns}(x, y, rewrite.knowns.pk=FALSE, ...)
\method{combine}{TRAMP}(x, y, rebuild=TRUE, ...)
}

\arguments{
  \item{x}{A \code{\link{TRAMPknowns}} or \code{\link{TRAMP}} object,
    containing identified TRFLP patterns.}
  \item{samples}{A \code{\link{TRAMPsamples}} object, containing
    unidentified samples.}

  \item{sample.fk}{\code{sample.fk} of sample in \code{samples} to add
    to the knowns database.  If \code{x} is a \code{\link{TRAMP}}
    object, then \code{sample.fk} refers to a sample in the
    \code{\link{TRAMPsamples}} object used in the creation of that
    \code{\link{TRAMP}} object (stored as \code{x$samples}: see
    \code{labels(x$samples)} for codes).}
  \item{prompt}{Logical: Should the function interactively prompt for a
    new species name?}
  \item{default.species}{Default species name.  If \code{NULL} (the
    default), the name chosen will be the value of
    \code{samples$info$species} for the current sample.  Set to
    \code{NA} if no name is currently known (see
    \code{\link{group.knowns}} - identical non-\code{NA} names are
    considered related).}
  \item{y}{A second \code{\link{TRAMPknowns}} object, containing knowns
    to add to \code{x}.}
  \item{rewrite.knowns.pk}{Logical: If the new knowns data contain
    \code{knowns.pk} values that conflict with those in the original
    \code{TRAMPknowns} object, should the new knowns be renumbered?  If
    this is \code{TRUE}, do not rely on \emph{any} \code{knowns.pk}
    values staying the same for the newly added knowns.
    \code{knowns.pk} values in the original \code{TRAMPknowns} object
    will never be changed.}
  \item{rebuild}{Logical: should the \code{\link{TRAMP}} object be
    rebuilt after adding knowns, by running \code{\link{rebuild.TRAMP}}
    on it?  This is important to determine if the new known(s) match any
    of the samples in the \code{TRAMP} object.  This should be left as
    \code{TRUE} unless you plan on manually rebuilding the object
    later.}
  \item{...}{Additional arguments passed to future methods.}
}

\details{
  (\code{add.known} only): When adding the profile of a single
  individual via \code{add.known}, if more than one peak per
  enzyme/primer combination is present we select the most likely profile
  by picking the highest peak (largest \code{height} value) for each
  enzyme/primer combination (a warning will be given).  If two peaks are
  of the same \code{height}, then the peak taken is unspecified (similar
  to \code{\link{build.knowns}} with \code{min.ratio=0}).

  (\code{combine} only): \code{rewrite.knowns.pk} provides a
  simple way of merging knowns databases that use the same values of
  \code{knowns.pk}.  Because \code{knowns.pk} must be unique, if
  \code{y} (the new knowns database) uses \code{knowns.pk} values
  present in \code{x} (the original database), then the \code{knowns.pk}
  values in \code{y} must be rewritten.  This will be done by adding
  \code{max(labels(x))} to \emph{every} \code{knowns.pk} value in
  \code{y$info} and \code{knowns.fk} value in \code{y$data}.

  If retaining \code{knowns.pk} information is important, we
  suggest saving the value of \code{knowns.pk} before running this
  function, e.g.

  \code{info$knowns.pk.old <- info$knowns.pk}

  If more control over the renaming process is required, manually adjust
  \code{y$info$knowns.pk} yourself before calling this function.
  However, by default no translation will be done, and an error will
  occur if \code{x} and \code{y} share \code{knowns.pk} values.

  For \code{add.known}, only a subset of columns are passed to the
  knowns object (a future version may be more inclusive):
  \itemize{
    \item From \code{samples$info}: \code{sample.pk} (as
    \code{knowns.pk}.)
    \item From \code{samples$data}: \code{sample.fk} (as
    \code{knowns.fk}), \code{primer}, \code{enzyme}, \code{size}.
  }

  For \code{combine}, the \code{data} and \code{info} elements of
  the resulting \code{TRAMPknowns} object will have the union of the
  columns present in both sets of knowns.  If any additional elements
  exist as part of the second \code{TRAMPknowns} object (e.g. passed as
  \code{...} to \code{\link{TRAMPknowns}} when creating \code{y}), these
  will be ignored.
}

\value{
  An object of the same class as \code{x}: if a \code{TRAMP} object is
  supplied, a new \code{TRAMP} object with an updated \code{TRAMPknowns}
  component will be returned, and if the object is a \code{TRAMPknowns}
  object an updated \code{TRAMPknowns} object will be returned.
}

\note{
  If the \code{TRAMPknowns} object has a \code{file.pat} element (see
  \code{\link{TRAMPknowns}}), then the new knowns database will be
  written to file.  This may be confusing when operating on \code{TRAMP}
  objects directly, since both the \code{TRAMPknowns} object used in the
  \code{TRAMP} object and the original \code{TRAMPknowns} object will
  share the same \code{file.pat} argument, but contain different data as
  soon as \code{add.known} or \code{combine} is used.  In short -
  be careful!  To avoid this issue, either set \code{file.pat} to
  \code{NULL} before using \code{add.known} or \code{combine}.
}

\seealso{\code{\link{build.knowns}}, which automatically builds a knowns
  database, and \code{\link{TRAMPknowns}}, which documents the object
  containing the knowns database.

  \code{\link{combine.TRAMPsamples}}, which combines a pair of
  \code{\link{TRAMPsamples}} objects.
}

\examples{
data(demo.knowns)
data(demo.samples)

## (1) Using add.known(), to add a single known:

## Sample "101" looks like a potential known, add it to our knowns
## database:
plot(demo.samples, 101)

## Add this to a knowns database:
## Because there is more than one peak per enzyme/primer combination, a
## warning will be given.  In this case, since there are clear peaks it
## is harmless.
demo.knowns.2 <- add.known(demo.knowns, demo.samples, 101,
                           prompt=FALSE)

## The known has been added:
demo.knowns.2[101]
try(demo.knowns[101]) # error - known didn't exist in original knowns

## Same, but adding to an existing TRAMP object.
res <- TRAMP(demo.samples, demo.knowns)
plot(res, 101)
res2 <- add.known(res, 101, prompt=FALSE, default.species="New known")

## Now the new known matches itself.
plot(res2, 101)

## (2) Using combine() to combine knowns databases.

## Let's split the original knowns database in two:
demo.knowns.a <- demo.knowns[head(labels(demo.knowns), 10)]
demo.knowns.b <- demo.knowns[tail(labels(demo.knowns), 10)]

## Combining these is easy:
demo.knowns.c <- combine(demo.knowns.a, demo.knowns.b)

## Knowns from both the small database are present in the new one:
identical(c(labels(demo.knowns.a), labels(demo.knowns.b)),
          labels(demo.knowns.c))


## Demonstration of knowns rewriting:
demo.knowns.d <- demo.knowns.a
demo.knowns.a$info$from <- "a"
demo.knowns.d$info$from <- "d"

try(combine(demo.knowns.a, demo.knowns.d)) # error
demo.knowns.e <- combine(demo.knowns.a, demo.knowns.d,
                         rewrite.knowns.pk=TRUE)

## See that both data sets are here (check the "from" column).
demo.knowns.e$info

## Note that a better approach in might be to manually resolve
## conficting knowns.pk values before combining.
}

\keyword{manip}

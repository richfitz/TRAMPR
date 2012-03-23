\name{read.write}
\alias{read.TRAMPknowns}
\alias{write.TRAMPknowns}
\alias{read.TRAMPsamples}
\alias{write.TRAMPsamples}

\title{Read/Write TRAMPknowns and TRAMPsamples Objects}

\description{Saves and loads \code{\link{TRAMPknowns}} and
  \code{\link{TRAMPsamples}} objects as a series of \dQuote{csv} (comma
  separated value) files for external editing.

  If you do not want to edit your data, then saving with
  \code{\link{save}} is preferable; it is faster, creates smaller files,
  and will save any additional components in the objects (see Examples).
}

\usage{
read.TRAMPknowns(file.pat, auto.save=TRUE, overwrite=FALSE)
write.TRAMPknowns(x, file.pat=x$file.pat, warn=TRUE)

read.TRAMPsamples(file.pat)
write.TRAMPsamples(x, file.pat)
}

\arguments{
  \item{x}{A \code{\link{TRAMPknowns}} or \code{\link{TRAMPsamples}}
    object.}
  \item{file.pat}{Pattern, with the filename prefix: \dQuote{info} and
    \dQuote{data} objects will be read/written as
    \code{<file.pat>_info.csv} and \code{<file.pat>_data.csv},
    respectively.}
  \item{auto.save}{Logical: Should \code{TRAMPknowns} object be
    automatically saved back to the loaded filename as it is modified
    (e.g. knowns added to the database).  If this is \code{TRUE}, the
    original files will be backed up as
    
    \code{<file.pat>_(info|data)_<YYYYMMDD>.csv},

    where \code{<YYYYMMDD>} is the ISO date.}
  \item{overwrite}{Should previous backup files be overwritten when
    creating new backups?}
  %% TODO: This is very unclear.
  \item{warn}{Should the function warn when no filename is given?
    (Because this function is called automatically when adding new
    knowns, and because \code{TRAMPknowns} objects need not contain a
    \code{file.pat} element, it may not be possible or neccesary to
    save).}
}

\details{
  \code{file.pat} may contain a path.  It is best to use forward slashes
  as directory separators (\code{path/to/file}), but on Windows (only),
  \emph{double} backslashes will also work (\code{path\\\\to\\\\file}).

  Paths may be either relative (e.g. \code{path/to/file}), or absolute
  (e.g. \code{/path/to/file}, or \code{x:/path/to/file} on Windows).
}

\seealso{
  \code{\link{load.abi}}, for semi-automatic loading of ABI output
  files.

  \code{\link{save}} and \code{\link{load}}, for saving and loading of
  arbitrary \R objects.
}

\examples{
\dontrun{
# Preferred way of saving/loading objects, if editing is not required:
save(demo.knowns, file="my_knowns.Rdata")

# (possibly in a different session, but _after_ loading TRAMP)
load("my_knowns.Rdata") # -> creates 'demo.knowns' in global environment
}
}

\keyword{file}

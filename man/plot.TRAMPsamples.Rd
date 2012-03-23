\name{plot.TRAMPsamples}
\alias{plot.TRAMPsamples}
\alias{TRAMPsamples.plotone}

\title{Plot a TRAMPsamples Object}

\description{Shows the peak profiles of samples in a
  \code{\link{TRAMPsamples}} object, showing
  the locations and heights of peaks for individual enzyme/primer
  combinations.  This is the same information that is displayed in the
  bottom portion of a \code{\link{plot.TRAMP}} plot, but may be useful
  where a \code{\link{TRAMP}} fit has not been performed yet
  (e.g. before a knowns database has been constructed).
}

\usage{
\method{plot}{TRAMPsamples}(x, sample.fk, ...)
TRAMPsamples.plotone(x, sample.fk, all.samples.global=FALSE, col=1:10,
                     xmax=NULL, mar.default=.5, mar.labels=8, cex=1)
}

\arguments{
  \item{x}{A \code{\link{TRAMPsamples}} object, containing profiles to
    plot.}
  \item{sample.fk}{The \code{sample.fk} to plot.  If omitted, then all
    samples are plotted, one after the other (this is useful for
    generating a summary of all fits for printing out: see Example).}
  \item{all.samples.global}{Logical: Should plots be set up for all
    enzyme/primer combinations present in \code{x}, even if the
    combinations are not present for all individual cases?  Analagous to
    the same argument in \code{\link{plot.TRAMP}}.  (This is useful for
    keeping combinations in the same place, and plotted with the same
    colours.)}
  \item{col}{Vector of colours to plot the different enzyme/primer
    combinations.  There must be at least as many colours as there are
    different combinations.}
  \item{xmax}{Maximum size (in base pairs) for the plots to cover.
    \code{NULL} (the default) uses the range of all data found in the
    \code{TRAMPsamples} object (rounded up to the nearest 100).
    \code{NA} will use the range of all data in the current sample.}
  \item{mar.default}{Margin size (in lines of text) to surround the
    plot.}
  \item{mar.labels}{Number of lines of text to be used for labels to the
    left of the plots.  Increase this if labels are being truncated.}
  \item{cex}{Scaling factor for text.}
  \item{...}{Additional arguments (ignored).}
}

\seealso{
  \code{\link{plot.TRAMP}}, the plotting method for \code{\link{TRAMP}}
  objects, and \code{\link{plot.TRAMPknowns}}, for
  \code{\link{TRAMPknowns}} objects.
}

\examples{
data(demo.samples)

plot(demo.samples, 101)
plot(demo.samples, 117)

\dontrun{
# Create a PDF file with all profiles:
pdf("all_profiles.pdf")
plot(demo.samples)
dev.off()
}
}

\keyword{hplot}

\name{plot.TRAMP}
\alias{plot.TRAMP}
\alias{TRAMP.plotone}

\title{Plot a TRAMP Object}

\description{Creates a graphical representation of matches performed by
  \code{\link{TRAMP}}.  The plot displays (1) \dQuote{matches}, showing
  how samples match the knowns and (2) \dQuote{peak profiles}, showing
  the locations of peaks for individual enzyme/primer combinations.
}

\usage{
\method{plot}{TRAMP}(x, sample.fk, ...)
TRAMP.plotone(x, sample.fk, grouped=FALSE, ignore=FALSE,
              all.knowns=TRUE, all.samples=FALSE,
              all.samples.global=FALSE, col=1:10,
              pch=if (grouped) 15 else 16, xmax=NULL, horiz.lines=TRUE,
              mar.default=.5, p.top=.5, p.labels=1/3, cex.axis=NULL,
              cex.axis.max=1)
}

\arguments{
  \item{x}{A \code{\link{TRAMP}} object.}
  \item{sample.fk}{The \code{sample.fk} to plot.  If omitted, then all
    samples are plotted, one after the other (this is useful for
    generating a summary of all fits for printing out: see Example).}
  \item{grouped}{Logical: Should the matched knowns be grouped?}
  \item{ignore}{Logical: Should matches marked as ignored by
    \code{\link{remove.TRAMP.match}} be excluded?}

  \item{all.knowns, all.samples, all.samples.global}{Controls which
    enzyme/primer combinations are displayed (see Details)}

  \item{col}{Vector of colours to plot the different enzyme/primer
    combinations.  There must be at least as many colours as there are
    different combinations.}
  \item{pch}{Plotting symbol to use (see \code{\link{points}} for
    possible values and their interpretation).  By default, this will
    use filled circles when ungrouped and filled squares when grouped.}
  \item{xmax}{Maximum size (in base pairs) for the plots to cover.
    \code{NULL} (the default) uses the range of all data found in the
    \code{TRAMPsamples} object (rounded up to the nearest 100).
    \code{NA} will use the range of all data in the current sample.}

  \item{horiz.lines}{Logical: Should horizontal grid lines be used for
    each matched known?}

  The following arguments control the layout and margins of the plot:
  \item{mar.default}{Margin size (in lines of text) to surround the
    plot.}
  \item{p.top}{Proportion of the plotting area to be used for the
    \dQuote{matches}.  The \dQuote{peak profiles} will share the bottom
    \code{1-p.top} of the plot.}
  \item{p.labels}{Proportion of the plotting area to be used for labels
    to the left of the plots.  \code{1-p.labels} will be used for the
    plots (try increasing this if you have very long species or group
    names).}
  \item{cex.axis}{Size of the text used for axes.  If \code{NULL} (the
    default), then the largest cex that will exactly fit labels is
    chosen (up to \code{cex.axis.max}).}
  \item{cex.axis.max}{Maximum size of the text used for axes, if
    automatically determining the label size (i.e. \code{cex.axis} is
    \code{NULL}).}
  \item{...}{Additional arguments passed to \code{TRAMP.plotone}.}
}

\details{
  This constructs a plot of a \code{\link{TRAMP}} fit, illustrating
  where knowns match the sample data, and which sample peaks remain
  unmatched.

  The top portion of the plot displays \dQuote{matches}, showing
  how samples match the knowns.  Individual species (or groups if
  \code{grouped} is \code{TRUE}) are represented by different horizontal
  lines.  Where the sample matches a particular known, a symbol is drawn
  (Beware: it may look like only one symbol is drawn when several
  symbols are plotted on top of one another).

  The bottom portion of the plot displays the \dQuote{peak profile} of
  the sample, showing the locations and heights of peaks for
  various enzyme/primer combinations (the exact combination depends on
  the values of \code{all.knowns}, \code{all.samples} and
  \code{all.samples.global}; see below).  The height is arbitrary, so
  units are ommited.

  The arguments \code{all.knowns}, \code{all.samples} and
  \code{all.samples.global} control which enzyme/primer combinations are
  displayed in the plot.  \code{all.knowns=TRUE} displays all
  combinations present in the knowns database and
  \code{all.samples=TRUE} displays all combinations present in the
  samples;  when \code{all.samples.global=TRUE} this is combinations
  across the entire samples data set, otherwise this is samples present
  in the \emph{current sample} only.  At least one of \code{all.knowns}
  and \code{all.samples} must be \code{TRUE}.
}

\note{
  While \code{TRAMP.plotone} does the actual plot, it should not be
  called directly; please use \code{plot(x, sample.fk, ...)}.
}

\seealso{
  \code{\link{plot.TRAMPknowns}}, for plotting \code{TRAMPknowns}
  objects, and \code{\link{plot.TRAMPsamples}}, for plotting
  \code{TRAMPsamples} objects.
}

\examples{
data(demo.samples)
data(demo.knowns)
res <- TRAMP(demo.samples, demo.knowns)

plot(res, 101)
plot(res, 110)
plot(res, 117)

plot(res, 117, grouped=TRUE)

\dontrun{
# Create a PDF file with all matches:
pdf("all_matches.pdf")
plot(res)
dev.off()
}
}

\keyword{hplot}

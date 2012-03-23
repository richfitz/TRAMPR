\name{plot.TRAMPknowns}
\alias{plot.TRAMPknowns}
\title{Summary Plot of Knowns Data}

\description{Creates a plot showing the clustering and profiles of a
  \code{\link{TRAMPknowns}} object (a \dQuote{knowns database}).  The
  plot has three vertical panels;

  \itemize{
    \item The leftmost contains a dendrogram, showing
    how similar the profiles of knowns are (see
    \code{\link{group.knowns}} for details).
    \item The rightmost displays the TRFLP profile for each individual
    (with a different colour symbol for each different enzyme/primer
    combination).
    \item The middle panel displays information on the species names and
    groups of the knowns.
  }
}

\usage{
\method{plot}{TRAMPknowns}(x, cex=1, name="species", pch=1, peaks.col, p=.02,
     group.clusters=TRUE, groups.col=1:4, grid.by=5, grid.col="gray",
     widths=c(1, 2, 1), ...)
}

\arguments{
  \item{x}{A \code{TRAMPknowns} object.}
  \item{cex}{Character size for the plot.  Because knowns databases can
    be large, this should be small and may need to be adjusted.  Most
    aspects of the plot will scale with this.}
  \item{name}{Column name to use when generating species names; must be
    one of \code{species} or \code{group.name}.}
  \item{pch}{Plotting symbol to use for peaks in the peak profiles.}
  \item{peaks.col}{Vector of colours to plot the different enzymes in
    the peak profiles.  These will be used in the order of the columns
    of \code{summary(x)}.}
  \item{p}{Scaling factor for the middle plot; this specifies the
    proportion of the width that elements are spaced horizontally from
    one another.  Columns of text are \code{p} apart, brackets grouping
    knowns are \code{p/2} apart, and cluster groups (if present) are
    \code{p*2/3} apart.}
  \item{group.clusters}{Logical: Should groups of clusters (determined
    by \code{group.strict} - see \code{\link{group.knowns}}) be joined
    together?}
  \item{groups.col}{Vector of colours to plot different group clusters
    in.  This will be recycled as neccessary.}
  \item{grid.by}{Interval between horizontal grid lines.  Grid lines
    start at \code{ceiling(grid.by/2)} from the bottom of the plot.  A
    value of \code{NA} suppresses grid lines.}
  \item{grid.col}{Colour of the horizontal grid lines.}
  \item{widths}{Relative widths of the three panels of the plot (see
    \code{\link{layout}}).  \code{widths} must be a vector of 3 elements,
    corresponding to the three panels from left to right.}
  \item{...}{Additional arguments (ignored).}
}

\note{In general, there will probably be too many knowns to make a
  legible plot when displayed on the screen.  We recommend creating a
  PDF of the plot and viewing that instead (see Example).

  When plotted on the interactive plotting device, if the plot is
  resized, the plot is likely to look strange.
}

\seealso{\code{\link{group.knowns}}, which controls the grouping of
  knowns, and \code{\link{TRAMPknowns}}, which constructs
  \code{TRAMPknowns} objects.}

\examples{
data(demo.knowns)
plot(demo.knowns)

\dontrun{
pdf("knowns_summary.pdf", paper="default", width=8, height=11)
plot(demo.knowns)
plot(demo.knowns, group.clusters=FALSE)
dev.off()
}
}

\keyword{hplot}

\name{TRAMPR-package}
\alias{TRAMPR-package}
\alias{TRAMPR}
\docType{package}
\title{The TRAMPR Package (TRFLP Analysis and Matching Package for R)}

\description{This package contains a collection of functions to help
  analyse terminal restriction fragment length polymorphism (TRFLP)
  profiles, by matching unknown peaks to known TRFLP profiles in order
  to identify species.

  The \code{TRAMPR} package contains a vignette, which includes a worked
  example; type \code{vignette("TRAMPRdemo")} to view it.  To see all
  documented help topics, type \code{library(help=TRAMPR)}.
}

\details{
  Start by reading the \code{\link{TRAMP}} (and perhaps
  \code{\link{create.diffsmatrix}}) help pages, which explain the
  matching algorithm.

  Then read \code{\link{load.abi}} to learn how to load ABI format data
  into the program.  Alternatively, read \code{\link{TRAMPsamples}} and
  \code{\link{read.TRAMPsamples}} to load already-processed data.

  If you already have a collection of knowns, read
  \code{\link{TRAMPknowns}} and \code{\link{read.TRAMPknowns}} to learn
  how to load them.  Otherwise, read \code{\link{build.knowns}} to learn
  how to automatically generate a set of known profiles from your data.

  Once your data are loaded, reread \code{\link{TRAMP}} to do the
  analysis, then read \code{\link{plot.TRAMP}} and
  \code{\link{summary.TRAMP}} to examine the analysis.
  \code{\link{update.TRAMP}} may also be useful for modifying your
  matches.  \code{\link{summary.TRAMP}} is also useful for preparing
  presence/absence matrices for analysis with other tools (e.g. the
  \pkg{vegan} package; see the vignette indicated below).

  \pkg{TRAMPR} works with database-like objects, and a basic
  understanding of relational databases and primary/foreign keys will
  aid in understanding some aspects of the package.
}

\note{
  \pkg{TRAMPR} is designed specifically for \dQuote{database TRFLP}
  (identifying species based on a database of known TRFLP profiles: see
  Dicke et al. 2002.  It is not designed for direct community analysis
  of TRFLP profiles as in peak-profile TRFLP.
}

\author{
  Rich FitzJohn and Ian Dickie, Landcare Research
}

\section{Citation}{
  Please see \code{citation("TRAMPR")} for the citation of
  \code{TRAMPR}.
}

\references{
  Dicke IA, FitzJohn RG 2007: Using terminal-restriction fragment length
  polymorphism (T-RFLP) to identify mycorrhizal fungi; a methods
  review. Mycorrhiza 17: 259-270.
  
  Dickie IA, Xu B, Koide RT 2002.  Vertical distribution of
  ectomycorrhizal hyphae in soil as shown by T-RFLP analysis.  New
  Phytologist 156: 527-535.

  FitzJohn RG, Dickie IA 2007: TRAMPR: An R package for analysis and
  matching of terminal-restriction fragment length polymorphism (TRFLP)
  profiles.  Molecular Ecology Notes
  [doi:10.1111/j.1471-8286.2007.01744.x].
}

\keyword{package}

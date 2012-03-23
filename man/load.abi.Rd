\name{load.abi}
\alias{load.abi}
\alias{load.abi.create.template}
\alias{load.abi.create.info}
\alias{peakscanner.to.genemapper}
\title{Load ABI Output Files}

\description{These functions help convert data from Applied Biosystems
  Gene Mapper (ABI) output format into \code{\link{TRAMPsamples}}
  objects for analysis.  Note that this operates on the summarised
  output (a text file), rather than the \code{.fsa} files containing
  data for individual runs.

  Details of the procedure of this function are given below, and a
  worked example is given in the package vignette; type
  \code{vignette("TRAMPRdemo")} to view it.

  The function \code{peakscanner.to.genemapper} is an experimental
  function to convert from peakscanner output to abi genemapper output.
  The peakscanner output is very slightly different in format, and
  currently \code{load.abi} is very fussy about the input file's
  structure.  Eventially \code{load.abi} will be made more tolerant, but
  as an interim solution, run \code{peakscanner.to.genemapper} on your
  file.  By default, running
  \code{peakscanner.to.genemapper(myfile.csv)} will produce a file
  \code{myfile.txt}.  This can then be loaded using \code{load.abi} as
  described below, specifying \code{myfile.txt} as the \code{file}
  argument.
}

\usage{
load.abi(file, file.template, file.info, primer.translate, ...)
load.abi.create.template(file, file.template)
load.abi.create.info(file, file.template, file.info)

peakscanner.to.genemapper(filename, output)
}

\arguments{
  \item{file}{The name of the file from which the ABI data are to be
    read from.}
  \item{file.template}{The name of the file containing the
    \dQuote{template} file (see Details).}
  \item{file.info}{(Optional) the name of the file containing extra
    information associated with each sample (see Details).}
  \item{primer.translate}{List used to translate dye codes into
    primers.  The same codes are assumed to apply across the whole
    file.  See Details for format.}
  \item{...}{Additional objects to incorportate
    into a \code{TRAMPsamples} object.  See \code{\link{TRAMPsamples}}
    for details.}

  \item{filename}{In \code{peakscanner.to.genemapper}, the name of the
    csv file containing output.}
  \item{output}{In \code{peakscanner.to.genemapper}, the name of the
    file to be output in abi format (if omitted, this will be
    automatically generated).}
}

\details{
  Some terminology: a \dQuote{sample} refers to a physical sample
  (e.g. a root tip), while a \dQuote{run} refers to an individual
  TRFLP run (i.e. one enzyme and one primer).  Because two primers are
  run at once, each \dQuote{runfile} contains information on two
  \dQuote{runs}, but each \dQuote{sample} may contain more than one
  \dQuote{runfile}.  Runfiles are distinguished by different
  \code{sample.file.name} values in the ABI file, while different
  samples are distinguished by different
  \code{sample.fk}/\code{sample.pk} values.

  \code{primer.translate} is a list used to translate between the dyes
  recorded in the ABI file and the primers used.  Each element
  corresponds to a different primer, and is a vector of different colour
  dyes.  The list:

  \code{list(ITS1F="B", ITS4="G")}

  would translate all dyes with the value \code{"B"} to \code{"ITS1F"},
  and all dyes with the value \code{"G"} to \code{"ITS4"}.  The list:

  \code{list(ITS1F="B", ITS4=c("G", "Y"))}

  would do the same, except that \emph{both} \code{"G"} and \code{"Y"}
  dyes would be converted to \code{"ITS4"}.  If a dye is used in the
  data that is not represented within \code{primer.translate}, then it
  will be excluded (e.g., all rows of data with \code{dye} as
  \code{"R"} will be excluded).

  The procedure for loading in ABI data is:
  \enumerate{
    %% Copied from the vignette:
    \item Create the \dQuote{template} file.  Template files are
    required to record which enzymes were used for each run, since that
    is not included in the ABI output, and to group together separate
    runs (typically different enzymes) that apply to the same
    individual.  The function \code{load.abi.create.template} will
    create a template that contains all the unique file names found in
    the ABI file (as \code{sample.file.name}), and blank columns titled
    \code{enzyme} and \code{sample.index}.  Running

    \code{load.abi.create.template(x)}

    where \code{x} is the name of your ABI file will create a template
    file in the same directory as the ABI file.  The function will print
    the name and location of the template file to the console.

    \item Edit the template file and save.  The \code{enzyme} and
    \code{sample.index} columns are initially empty and need filling in,
    which can be done in Excel, or another spreadsheet program.  The
    \code{sample.index} column links \code{sample.file.name} back to an
    individual sample; multiple \code{sample.file.name}s that share
    \code{sample.index} values come from the same individual sample.
    (If editing with Excel, ignore all the warnings about incompatible
    file formats when saving.)  \code{sample.index} should be a positive
    integer (but see Note below).

    \item Optionally create an \dQuote{info} file, which is useful if
    you want to associate extra information against your samples.  The
    function \code{load.abi.create.info} will create an info file that
    contains all the unique values of \code{sample.index}, and an empty
    column titled \code{species}.  The \code{species} column can be
    filled in where the species is known (e.g. from collections of
    sporocarps).  Any additional columns may be added.  Running

    \code{load.abi.create.info(x)}

    where \code{x} is the name of your ABI file will create an info
    file in the same directory as the ABI file.  The function will print
    the name and location of the info file to the console.  Edit and
    save this file.

    \item Create the \code{TRAMPsamples} object by running
    \code{load.abi}.  This loads your ABI data, plus the new template
    file, plus an optional information file.  Running

    \code{my.samples <- load.abi(x, primer.translate=primer.translate)}

    will create an object \dQuote{\code{my.samples}} containing your
    data.
  }

  By default, the filenames of the template and info files will be
  automatically generated: \code{<prefix>.<ext>} becomes
  \code{<prefix>_template.csv} or \code{<prefix>_info.csv}.  If you
  choose to specify \code{file.template} or \code{file.info} manually
  when running \code{load.info.create.template} or
  \code{load.info.create.info}, you must use the same values of
  \code{file.template} and \code{file.info} when running
  \code{load.abi}.
}

\note{
  There is no reason that data from other types of output files could
  not be manually imported using \code{TRAMPsamples}.  We welcome
  contributions for other major data formats.

  When creating \code{sample.index} values, these should be positive
  integers.  If you enter strings (e.g. \code{a1}, \code{b1}), these
  will be automatically converted into integers.  Once loaded,
  \code{sample.pk}/\code{sample.fk} is always a positive integer key,
  but \code{sample.index} will be retained as your string keys.
}

\section{Warning}{
  Do not change the names of any columns produced by
  \code{load.abi.create.template} or \code{load.abi.create.info}.
}

\seealso{
  \code{\link{read.abi}}, which reads in ABI data with few
  modifications.

  \code{\link{TRAMPsamples}}, which documents the data type produced by
  \code{load.abi}.

  The package vignette, which includes a worked example of loading data
  using these functions; to locate the vignette, type
  \code{help(library=TRAMPR)}, and scroll to the bottom of the page, or
  type: \code{system.file("doc/TRAMPR_demo.pdf", package="TRAMPR")}.
}

\keyword{file}

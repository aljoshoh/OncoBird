% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/se_wrapper.R
\name{cl_enrichment_genomics}
\alias{cl_enrichment_genomics}
\title{Calculate enrichment for mutations in subtypes}
\usage{
cl_enrichment_genomics(
  se,
  sample_column,
  min_mutants,
  clin_alterations = NULL,
  subtype
)
}
\arguments{
\item{se}{SE object}

\item{sample_column}{subtype column}

\item{min_mutants}{minimum number of mutants for conducting a
statistical test}

\item{clin_alterations}{binary clinical columns to join with mutations}

\item{subtype}{character vector containing subtypes to screen for enrichments}
}
\value{
SE object with metadata containing subtype enrichment tests
'enrichment_genomics'
}
\description{
Running hypergeometric tests for mutations in specified subtypes
}
\examples{
{
  
 sim_data <- sim_data()
  
 se <- prepare_data(
    data = sim_data,
    vars = "OS",
    med_impute_muts = TRUE,
    remove_clin = NA,
    sample_column = "ID",
    treatment_column = "trt",
    mutation_columns = colnames(sim_data)[1:5])
    
 se <- cl_subtype_enrichment(
    se = se,
    col_label = "s",
    row_label = "r",
    digits = 3
 )
  
 se <- cl_enrichment_genomics(se,
    sample_column = "sample",
    min_mutants = 10,
    subtype = c("s", "r")
  )
}

}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/se_wrapper.R
\name{cl_cv}
\alias{cl_cv}
\title{Perform cross validation for performance}
\usage{
cl_cv(
  se,
  treatment,
  subtype,
  readout,
  include_covariates = NULL,
  min_samples = 10,
  min_redistribution = 10,
  meta_load = TRUE,
  meta_path = "metadata",
  nfold = 5,
  initialisations = 5,
  fdr_int_threshold = 0.1,
  fdr_threshold = 0.1
)
}
\arguments{
\item{se}{SE object}

\item{treatment}{levels for treatment column}

\item{subtype}{character for subtype column}

\item{readout}{character for readout (OS,PFS,DFS,RFS,ORR)}

\item{include_covariates}{character vector with confounding factors}

\item{min_samples}{Specifies minimum amount of mutants per alteration}

\item{min_redistribution}{how many patients get different status when
using MEs}

\item{meta_load}{logical if analysis exists already}

\item{meta_path}{path of metadata object}

\item{fdr_int_threshold}{interaction FDR threshold}

\item{fdr_threshold}{treatment-specific FDR threshold}

\item{n_bootstraps}{number of permutations for multiplicity adjustment}
}
\value{
a table of significant gene modules
}
\description{
performance of oncobird based on cross-validation for detecting interactions
}
\examples{
\dontrun{

  sim_data <- sim_data()
  
  se <- prepare_data(
    data = sim_data,
    vars = "OS",
    med_impute_muts = TRUE,
    remove_clin = NA,
    sample_column = "ID",
    treatment_column = "trt",
    mutation_columns = colnames(sim_data)[1:5])
    
    
  se <- cl_treatment_specific_biomarkers(se, 
     min_samples = 10,
     min_redistribution = 3,
     treatment = c("chemo", "no_chemo"),
     subtypes = c("s", "r"),
     readouts = c("OS"))
  
  se <- pl_treatment_specific_biomarkers_subtype(se, fdr_max = 0.1)
  
  se <- cl_tsb_modules_oncoprint(se, p_value = 0.05, fdr = 0.1)
  
  se <- cl_predictive_biomarkers(
    se = se,
    min_samples = 10,
    min_redistribution = 5)
  
  se <- pl_predictive_biomarkers_subtypes(se,
    fdr_max = 0.1,
    colors = NULL,
    labels = NULL)
  
  se <- cl_predictive_comparison(
    se = se,
    subtypes = c("s", "r"),
    readouts = c("OS"),
    covariates = FALSE,
    fdr_i = 0.5)
    
  cl_cv(
    se = se,
    treatment = metadata(se)$wf_meta$treatment,
    subtype = "r",
    readout = c("OS"),
    include_covariates = NULL,
    min_samples = 10,
    min_redistribution = 10,
    meta_load = FALSE,
    meta_path = "metadata",
    n_bootstraps = 10,
    fdr_int_threshold = 0.1,
    fdr_threshold = 0.1
)
}

}

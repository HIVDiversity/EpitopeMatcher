#' Gets all the patient ids that are in both the MSA and the patient_hla file
#' @param query_alignment The query alignment
#' @param patient_hla The data.frame (of class Patient_HLA) that contain lists
#' all the HLA genotypes each patient has.
#' @export

get_matchable_patient_ids <- function(query_alignment, patient_hla){

  # These checks can be done better using OO features?
  stopifnot(class(query_alignment) == 'AAMultipleAlignment')
  stopifnot(class(patient_hla) == 'Patient_HLA')

  qa_ids <- get_patient_ids(query_alignment)
  ph_ids <- get_patient_ids(patient_hla)
  m_ids <- qa_ids[qa_ids %in% ph_ids]
  if (length(unique(qa_ids)) != length(unique(m_ids))){
    warning("Not all patients in query_alignment have hla genotypes specified.
            They will not be analyzed") }
  return(m_ids)
}

#' Lists all the hla genotypes that must be investigated
#' @param query_alignment The query alignment
#' @param patient_hla The data.frame (of class Patient_HLA) that contain lists
#' all the HLA genotypes each patient has.
#' @export

list_hlas <- function(query_alignment, patient_hla){
  
  # These checks can be done better using OO features?
  stopifnot(class(query_alignment) == 'AAMultipleAlignment')
  stopifnot(class(patient_hla) == 'Patient_HLA')

  m_ids <- get_matchable_patient_ids(query_alignment, patient_hla)
  return(patient_hla[patient_hla$patient_id %in% m_ids, 'hla_genotype'])
}

#' Lists all the hla genotypes that must be investigated
#' @param query_alignment The query alignment
#' @param patient_hla The data.frame (of class Patient_HLA) that contain lists
#' all the HLA genotypes each patient has.
#' @export

list_epitopes <- function(query_alignment, patient_hla, lanl_hla_data){
  
  # These checks can be done better using OO features?
  stopifnot(class(query_alignment) == 'AAMultipleAlignment')
  stopifnot(class(patient_hla) == 'Patient_HLA')
  stopifnot(class(lanl_hla_data) == 'LANL_HLA_data')

  hlas <- list_hlas(query_alignment, patient_hla)
    col_names <- c("epitope", "gene_name", "start_pos", "end_pos", 
                   "sub_type", "organism", "hla_genotype")

  return(lanl_hla_data[lanl_hla_data$hla_genotype %in% hlas, 
                       c('epitope', 'start_pos', 'end_pos')])
}
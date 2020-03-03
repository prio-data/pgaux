#' @title make_raw_data_spec 
#' @description This function is used to generate the raw_specification.yaml file which is used to test the integrity of data before trying to compile priogrid.
#' @param folder A folder containing the raw data
#' @param out Where to write the yaml file 
#' @export
make_raw_data_spec <- function(folder,out,add_comment=TRUE){
   comment <- "
   # =%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%
   # This file contains the mapping of data group names to hash 
   # values which is used to ascertain the integrity of the raw
   # data before building priogrid. 
   # =%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%
   "
   files <- list.files(folder,full.names = TRUE)
   files <- files[file.info(files)$isdir]
   hashes <- lapply(files,function(f){
      priogrid::get_folder_fingerprint(priogrid::datapath(f))
   })
   names(hashes) <- files
   rep <- yaml::as.yaml(hashes)
   if(add_comment){
      rep <- paste(comment,rep,sep = "\n\n")
   }
   rep
}

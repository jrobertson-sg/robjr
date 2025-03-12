#' List and select from available Objective Connect objects in the workspace and download it
#'
#' @keywords objective objr
#' @param dlpath path for the downloaded file to be placed in
#' @param overwrite Overwrite existing local file (logical)
#' @export
#' @examples
#' pullConnect("file.xlsx","New File Name")
#' 

pullConnect = function(dlpath = ".", overwrite = T){
  checkAuthority()
  
  if(!exists("ocws")){
    idWorkspace()
  }
  
  ocdoc = idFile()
  download_file(ocdoc,dlpath,overwrite = T)
  
  reformNames(dlpath)
}

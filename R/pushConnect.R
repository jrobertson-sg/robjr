#' Move an existing file into the Objective Connect workspace
#'
#' @keywords objective objr
#' @param doc path to file to be sent to the Objective Connect workspace
#' @param name name of the new object in the Objective Connect workspace. Not required for updating existing objects.
#' @param update update and exists document? (logical)
#' @export
#' @examples
#' pushConnect("file.xlsx","New File Name")
#' 


pushConnect = function(doc,name,update = F){
  
  if(!exists("ocws")){idWorkspace()}
  
  if(!update){
    #if(is.na(name){stop("You must supply a name for the Objective Connect Object being created.")}
    
    upload_file(doc, 
                name = name,
                uuid = ocws)
  }
  
  if(update){
    idFile()
    upload_file_version(doc,uuid = ocdoc)
  }
}

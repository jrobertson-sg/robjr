#' List and select from available Objective Connect objects in the workspace
#'
#' @keywords objective objr
#' @export
#' @examples
#' checkAuthority()
#' 


idFile = function(){
  checkAuthority()
  
  if(!exists("ocws")){
    idWorkspace()
  }
  assets = select(assets(ocws,size = 1e3), asset_name,asset_uuid) 
  print(select(assets,asset_name), n=100)
  
  fileindex=as.numeric(readline(prompt = "Which document? (Enter number): "))
  
  ocdoc = assets$asset_uuid[fileindex]
  
  print(paste("Document '",assets$asset_name[assets$asset_uuid == ocdoc],"' selected. Reference variable 'ocdoc'"))
  
  assign("ocdoc", ocdoc, envir = .GlobalEnv)
  
  return(ocdoc)
}

#' List and select available Objective Connect workspaces
#'
#' @keywords objective objr
#' @export
#' @examples
#' idWorkspace()
#' 

idWorkspace = function(){
  
  wk = workspaces()
  
  if(nrow(wk)>1){
    transmute(wk,workspace_name,workspace_uuid = paste0("...",substr(wk$workspace_uuid,35,39))) %>% print()
    wk_selected=as.numeric(readline(prompt = "Which workspace? (Enter number): "))
    ocws = wk$workspace_uuid[wk_selected]
  } else {
    ocws = wk$workspace_uuid[1]
  }
  
  print(paste(wk$workspace_name[wk$workspace_uuid==ocws],"selected. Reference variable 'ocws'"))
  assign("ocws", ocws, envir = .GlobalEnv)
  
  return(ocws)
}

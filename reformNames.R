#' Rename downloaded files to remove %20 space tokens
#'
#' @keywords objective objr
#' @param dlpath path of downloaded files from Objective Connect
#' @export
#' @examples
#' reformNames("file%20A.xlsx")
#' 

reformNames = function(dlpath){
  old = list.files(dlpath,full.names = TRUE)
  new = gsub(pattern = "%20", replacement = " ", x = old)
  file.rename(from = old, to = new)
}
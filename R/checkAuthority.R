#' Check for and validate 2FA token to access Objective Connect
#'
#' @keywords objective objr
#' @export
#' @examples
#' checkAuthority()
#' 

checkAuthority = function(){
  # Access and list files in ObjectiveConnect folder
  if(!exists("token")){
    print("Enter Objective Connect login details")
    me <- my_user_id()
  } else {
    # Check token validity
    result <- try(my_user_id())
    if(substr(result,1,5)[1] == "Error"){
      # Invalid token - refresh
      print("Token expired. Enter Objective Connect login details")
      rm(token)
      me <- my_user_id()
      #print(me)
    } else {
      # Valid token
      print("Existing token still valid")
    }
  }
}

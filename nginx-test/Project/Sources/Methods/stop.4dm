//%attributes = {}
If (Is macOS:C1572)
	
	var $stdIn; $stdOut; $stdErr : Text
	var $pid : Integer
	
	$p:=Folder:C1567(Folder:C1567("/RESOURCES/").platformPath; fk platform path:K87:2).path
	$command:="nginx -p "+cli_escape($p)+" -s stop"
	
	$_4D_OPTION_CURRENT_DIRECTORY:=nginx_dir
	
/*
https://nginx.org/en/docs/switches.html
-s signal
*/
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_CURRENT_DIRECTORY"; $_4D_OPTION_CURRENT_DIRECTORY)
	LAUNCH EXTERNAL PROCESS:C811($command; $stdIn; $stdOut; $stdErr; $pid)
	
End if 
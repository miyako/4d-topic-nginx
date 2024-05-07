//%attributes = {}
If (Is macOS:C1572)
	
	var $stdIn; $stdOut; $stdErr : Text
	var $pid : Integer
	
	$p:=Folder:C1567(Folder:C1567("/RESOURCES/").platformPath; fk platform path:K87:2).path
	$command:="nginx -p "+cli_escape($p)
	
	$_4D_OPTION_CURRENT_DIRECTORY:=nginx_dir
	
/*
https://nginx.org/en/docs/switches.html
-p prefix
	
the prefix does not seem to apply to paths that are passed to openssl
in such cases the conf file parent folder is uses as prefix
	
so just put the certificates in /conf/  
ssl_certificate      cert.pem;
ssl_certificate_key  key.pem;
	
*/
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_CURRENT_DIRECTORY"; $_4D_OPTION_CURRENT_DIRECTORY)
	LAUNCH EXTERNAL PROCESS:C811($command; $stdIn; $stdOut; $stdErr; $pid)
	
End if 
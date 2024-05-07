//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($in : Text) : Text

$params:=$in

Case of 
	: (Is Windows:C1573)
		
		//argument escape for cmd.exe; other commands (curl, ruby, etc.) may be incompatible
		
		$shoudQuote:=False:C215
		
		$metacharacters:="&|<>()%^\" "
		
		$len:=Length:C16($metacharacters)
		
		For ($i; 1; $len)
			$metacharacter:=Substring:C12($metacharacters; $i; 1)
			$shoudQuote:=$shoudQuote | (Position:C15($metacharacter; $params; *)#0)
			If ($shoudQuote)
				$i:=$len
			End if 
		End for 
		
		If ($shoudQuote)
			If (Substring:C12($params; Length:C16($params))="\\")
				$params:="\""+$params+"\\\""
			Else 
				$params:="\""+$params+"\""
			End if 
		End if 
		
	: (Is macOS:C1572)
		
		$metacharacters:="\\!\"#$%&'()=~|<>?;*`[] "
		
		For ($i; 1; Length:C16($metacharacters))
			$metacharacter:=Substring:C12($metacharacters; $i; 1)
			$params:=Replace string:C233($params; $metacharacter; "\\"+$metacharacter; *)
		End for 
		
End case 

return $params
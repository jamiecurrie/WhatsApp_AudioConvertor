-- Copyright Jamie Currie 2014
-- www.jamie-currie.com

set the_folder to choose folder
set the_file to choose file
set the_text to (every paragraph of (read the_file))
set nameString to {}

set i to 0

repeat with aName in the_text
	
	if (i > 0) then
		
		try
			
			set AppleScript's text item delimiters to ": "
			set firstName to (text item 1 of aName) & ": " & (text item 2 of aName) & ": "
			
			set AppleScript's text item delimiters to firstName
			set fileName to text item 2 of aName
			set AppleScript's text item delimiters to " <"
			set fileName to text item 1 of fileName
			
			set AppleScript's text item delimiters to ": "
			set firstName to (i as string) & "_" & first word of (text item 2 of aName) & second word of (text item 2 of aName) & ".aac"
			
			set fileUrl to POSIX path of the_folder & fileName
			set newFileUrl to POSIX path of the_folder & firstName
			
			try
				do shell script "mv " & fileUrl & " " & newFileUrl
			end try
			
		end try
		
	end if
	
	set i to i + 1
	
end repeat

display dialog "Converting Complete"

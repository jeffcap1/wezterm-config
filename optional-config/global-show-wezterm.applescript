on run {input, parameters}
	set appName to "WezTerm"
	tell application "System Events"
		set frontmost of application process appName to true
		set visible of application process appName to true
	end tell
end run

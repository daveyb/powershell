# A Collection of Powershell Stuff

 [CrashPlan.ps1](#crashplan)
 [Microsoft.Powershell_profile.ps1](#profile)

 <a name="crashplan"></a>
 CrashPlan.ps1
 
 Use with a scheduled task to start/stop CrashPlan service (because it chews up RAM).
 
 `powershell "path\to\crashplan.ps1" [start|stop] -WindowStyle Hidden` 

<a name="profile"></a>
Microsoft.Powershell_profile.ps1

The PowerShell profile is loaded with the PowerShell environment, much like .bash_profile.
Functions in this file typically wrap much longer commands that I can't remember.

The PowerShell profile is not included out-of-the-box. To provision:
`New-Item -path $Profile -type file -force`
(assuming ExecutionPolicy is set to unrestricted)

I recommend symlinking this file to where you've cloned the repository (I use OneDrive, Dropbox, etc).
`cmd /c mklink /h "path/of/link" "path/to/target"`
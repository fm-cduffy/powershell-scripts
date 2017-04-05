
<#######################

SETUP: Contains all setup information for path and
scripts used in each path


#######################>

$Header = "`r`n** * * * **`r`nScripts Avaliable for Use:`r`n"
$Footer = "`r`n** * * * **`r`n"

$FolderPath= "$ENV:USERPROFILE\Documents\WindowsPowerShell\scripts"
$ScriptPath = @("TimeTracking.ps1")


<#######################

FUNCTION: takes the path and array from setup and 
checks each scripts avaliablity before usage in 
the shell

steps to setup profile for use

Test-path $profile
New-item –type file –force $profile
Set-ExecutionPolicy RemoteSigned  or  Set-ExecutionPolicy Unrestricted
Notepad $profile

ENTER IN THE FOLLOWING IN NOTEPAD WINDOW
$ScriptList = "$ENV:USERPROFILE\Documents\WindowsPowerShell\"
. $ScriptList


#######################>

function scriptChecker([array]$Scripts, [string]$Path){

    foreach($Script in $Scripts){

        $fullPath = $Path + "\" + $Script

        if((Test-Path $fullPath)){
            
            .$fullPath
            
            $boolConnect = $True

        }else{
            
            $boolConnect = $False

        }
        
        if(($Script.Contains("LaptopNameChange")))
        {    
            
            $indexStart = $Script.IndexOf("\") +1
            $Script = $Script.Substring($indexStart)

        }
        
        $Script = $Script.TrimEnd(".ps1")
        
        if(($boolConnect)){
            
            $Script

        }else{
        
            "Not Available: " + $Script

        }

    }

}


<#######################

INITIALIZE: runs script checker inclosing 
    output in header and footer for readablitiy


########################>

$Header

. scriptChecker -Path $FolderPath -Scripts $ScriptPath

$Footer

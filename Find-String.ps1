[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
    #Path
    [string]$Path = (Read-Host -Prompt 'Path'),
	
    #Search string
    [Parameter(Mandatory=$True, Position=2)]
    [string]$SearchString = (Read-Host -Prompt 'SearchString'),

    #Filter
    [Parameter(Mandatory=$True, Position=2)]
    [string]$Filter = (Read-Host -Prompt 'Filter')
)



$PathArray = @() 
Get-ChildItem $Path -Filter $Filter -recurse |  
Where-Object { $_.Attributes -ne "Directory"} |  
ForEach-Object {  
    If (Get-Content $_.FullName | Select-String -Pattern $SearchString) { 
        $PathArray += $_.FullName 
        $PathArray += $_.FullName 
    } 
} 

#Write Output
$PathArray | ForEach-Object {$_}  

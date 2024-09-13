Param(
    [Hashtable]$parameters
)

function Get-NavDefaultCompanyName
{
    return "CRONUS International Ltd."
}

# Get the repoversion
#Import-Module "$PSScriptRoot\EnlistmentHelperFunctions.psm1"
$repoVersion = "26.0" #Get-ConfigValue -ConfigType "AL-GO" -Key "RepoVersion"
$containerName = $parameters.ContainerName
$DemoDataType = "EXTENDED"

Write-Host "Initializing company"
Invoke-NavContainerCodeunit -Codeunitid 2 -containerName $ContainerName -CompanyName (Get-NavDefaultCompanyName)

Write-Host "Importing configuration package"
Invoke-NavContainerCodeunit -Codeunitid 8620 -containerName $containerName -CompanyName (Get-NavDefaultCompanyName) -MethodName "ImportAndApplyRapidStartPackage" -Argument "C:\ConfigurationPackages\NAV$($repoVersion).W1.ENU.$($DemoDataType).rapidstart"
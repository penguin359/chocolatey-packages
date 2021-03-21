$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$pathToRemove = "${env:PROGRAMFILES}\Amazon\SessionManagerPlugin\bin"
 
foreach ($registryPath in 'hklm:\system\currentcontrolset\control\session manager\environment', 'hkcu:\environment') {
  $p = (Get-Itemproperty -path "$registryPath" -Name Path).Path
  if ("$p" | Select-String -SimpleMatch "$pathToRemove"){
    $newPath = ("$p" -split ';' | ForEach-Object { if (-not ($_ -eq "$pathToRemove")) { $_ } } ) -join ';'
    Set-ItemProperty -path "$registryPath" -Name Path -Value $NewPath
  }
}

Remove-Item -Recurse "${env:PROGRAMFILES}\Amazon\SessionManagerPlugin\" -ErrorAction SilentlyContinue
If ((Get-ChildItem "${env:PROGRAMFILES}\Amazon\") -eq 0) { Remove-Item -Recurse "${env:PROGRAMFILES}\Amazon\" -ErrorAction SilentlyContinue }

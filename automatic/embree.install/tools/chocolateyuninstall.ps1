$ErrorActionPreference = 'Stop';
 
$pathToRemove = "$(${env:ProgramW6432})\Intel\Embree3 x64\bin"
 
foreach ($registryPath in 'hklm:\system\currentcontrolset\control\session manager\environment', 'hkcu:\environment') {
  $p = (Get-Itemproperty -path "$registryPath" -Name Path).Path
  if ("$p" | Select-String -SimpleMatch "$pathToRemove"){
    $newPath = ("$p" -split ';' | ForEach-Object { if (-not ($_ -eq "$pathToRemove")) { $_ } } ) -join ';'
    Set-ItemProperty -path "$registryPath" -Name Path -Value $NewPath
  }
}
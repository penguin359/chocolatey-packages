$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  filetype    = "MSI"
  file64      = "$toolsDir\embree-3.12.0.x64.vc14.msi"
  silentArgs  = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyInstallPackage @packageArgs

Install-ChocolateyPath -PathToInstall "$(${env:ProgramW6432})\Intel\Embree3 x64\bin"
Install-ChocolateyEnvironmentVariable -VariableName "embree_DIR" -VariableValue "$(${env:ProgramW6432})\Intel\Embree3 x64\bin"

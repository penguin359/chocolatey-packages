$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
    
  file          = "$toolsDir\tcl-8.6.9-installer-1.9.1-x86.msi"
  filetype      = "msi"
  checksum      = '444B6610B9608CA652C774D80804F29599DD045C06755751D356D3AF33F53EB1'
  checksumType  = 'sha256'
  
  file64        = "$toolsDir\tcl-8.6.9-installer-1.9.1-x64.msi"
  filetype64    = "msi"
  checksum64    = '88A13E9E41C803076558DBC6EE3CAB09CE8906DC50C478430F1D6F61D080CF97'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v C:\Users\Chris\AppData\Local\Temp\$env:ChocolateyPackageName.MsiInstall.log"
}

Install-ChocolateyInstallPackage @packageArgs
$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = "kdevelop"
  fileType       = "EXE"
  silentArgs     = "/S"  
  url           = 'http://download.kde.org/stable/kdevelop/5.3.2/bin/windows/kdevelop-5.3.2-x86-setup.exe'
  url64bit      = 'http://download.kde.org/stable/kdevelop/5.3.2/bin/windows/kdevelop-5.3.2-x64-setup.exe'
  
  checksum      = '3c0e8d9369cf40a43499f7353cf2920ef678cdfea4dba5d7ef37d2d69c246019'
  checksumType  = 'sha256'
  checksum64    = '9306d8651fbd718f46f1beb022d8f9d58ae57eff7cf1f0c3594c21280c9df00f'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}

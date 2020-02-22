$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'http://download.kde.org/stable/kdevelop/5.4.2/bin/windows/kdevelop-5.4.2-x64-setup.exe'
  checksum64     = '61bffb73e76fc1754aaa99bea5afee821fd19de481900819f4e0d3c5e902037a'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}

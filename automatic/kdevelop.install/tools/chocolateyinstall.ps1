$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'http://download.kde.org/stable/kdevelop/5.5.0/bin/windows/kdevelop-5.5.0-x64-setup.exe'
  checksum64     = 'f282c8c798197a79e39692aa8108c5ead58950258ee85cbae8cb571196ecddd2'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}

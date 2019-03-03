$ErrorActionPreference = 'Stop';

(Get-WmiObject -Class Win32_OperatingSystem).Version -match "(?<Major>\d+).(?<Minor>\d+).(?<Build>\d+)" | Out-Null
[float]$winVer=$null
[float]::TryParse(("{0}.{1}{2}" -f $Matches.Major, $Matches.Minor, $Matches.Build), [ref]$winVer ) | Out-Null
if ($winVer -le 10.0)
{
    # Windows versions previous to Windows 10 require a prerequisite hotfix
    if (-not (Get-HotFix -Id KB2999226 -ErrorAction SilentlyContinue))
    {
        Write-Error "A prerequisite for installing Visual Studio 2015 applications is to have hotfix KB2999226 installed. See https://support.microsoft.com/en-us/kb/2999226 for more details"
    }
}
 
$installArgs  = "/S"
 
$params = @{
  packageName    = "kdevelop"
  fileType       = "EXE"
  silentArgs     = $installArgs  
  url           = 'http://download.kde.org/stable/kdevelop/5.3.1/bin/windows/kdevelop-5.3.1-x86-setup.exe'
  url64bit      = 'http://download.kde.org/stable/kdevelop/5.3.1/bin/windows/kdevelop-5.3.1-x64-setup.exe'
  
  checksum      = '993D422CAF0CBF0C9AC330687C4D3555DC309FED65E4476FEF7C4CB803F9319B'
  checksumType  = 'sha256'
  checksum64    = 'E346414B148B497D400B5AA3ED68E7EAE688F5AF313666197AF39C5E9F252FAC'
  checksumType64= 'sha256'
}
 
Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}
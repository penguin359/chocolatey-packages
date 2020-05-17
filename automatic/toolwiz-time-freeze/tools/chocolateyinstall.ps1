$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://www.toolwiz.com/downloadfiles/Setup_Timefreeze.exe'
  checksum      = 'D2636E005AA7683BEA4D5375901BAEE06F19B82EED129ED834E94D816C6F20D8'
  checksumType  = 'sha256'

  silentArgs    = '-install'
}

Install-ChocolateyPackage @packageArgs

Write-Warning "A restart is needed after the installation of toolwiz-time-freeze."

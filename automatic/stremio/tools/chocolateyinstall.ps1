$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.141/Stremio+4.4.141.exe'
  checksum     = '282a4ee6851dc86802b670aab6f092bf55c43c02567c08c238c3628c4091f320'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc12d6589ffbad80c875ffbf57ae.dl.dropboxusercontent.com/cd/0/get/A-O9S1BIwGKc1jNxdhoApHRXgYTS7hB7nS6lexpIO1hCQUrH_tbYAuiwFmRdCF1GzRYk-Vs_a1bYq6wm4Pu_di5eDRXcwA3W41Shgl41bJHvuDQpIbQPQRlx6BjKInBnc9k/file?dl=1#'
  checksum     = 'f94b1c2b40dd70a9d1683a6034fa4c095e3d797b0daa8e8a51a438f89bbeec50'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

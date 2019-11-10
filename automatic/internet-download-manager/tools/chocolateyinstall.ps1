$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build9.exe?b=1&filename=idman635build9.exe'
  checksum      = '3bc1b0345586114fba4a6f7bdaed001134d9550c9452319fcaef63d65964adad'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs

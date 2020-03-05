$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.4.0.0.msi'
  checksum      = 'ccbd35f82952c353f5da83210e46a0dfd8d4c4a8c8d3ee86fb5ab65ebbdb739f'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.4.0.0x64.msi'
  checksum64    = '9b86508a719ab49cc141cb008525321be99f167ffdecc9d25584852a5a2df5f1'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

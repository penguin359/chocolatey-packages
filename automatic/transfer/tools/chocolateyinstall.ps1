$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url64bit      = 'https://transferapp.frame.io/Frame.io-Transfer/6ab0c27d61d7cf8793b0357e6533ed81/latest/win32/x64/Frame.io+Transfer.exe'
  checksum64    = '2900C48192C9D6F36180C5FFE7BFDE98DABED6CA84E46E0FA4488E990C34DB32'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs

# Stop Frame.io Transfer as it is automatically launched after installation.
$started = $false
Do {
    $status = Get-Process 'Frame.io Transfer' -ErrorAction SilentlyContinue
    If (!($status)) { Start-Sleep -Seconds 2 } 
    Else { Stop-Process -Name 'Frame.io Transfer' ; $started = $true }
}
Until ( $started )
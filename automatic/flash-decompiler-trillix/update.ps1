Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_SearchReplace {
   @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }        
    }
}

function global:au_AfterUpdate {
  "$($Latest.ETAG)|$($Latest.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
}

function GetResultInformation([string]$url32) {
  $dest = "$env:TEMP\flash_decompiler.exe"
  Get-WebFile $url32 $dest | Out-Null
  $version = Get-Item $dest | % { $_.VersionInfo.ProductVersion -replace '^([\d]+(\.[\d]+){1,3}).*', '$1' }
  #$version = Get-Date -format "yyyy.MM.dd"

  $result = @{
    URL32          = 'http://www.flash-decompiler.com/download/flash_decompiler.exe'
    Version        = Get-FixVersion -Version $version
    Checksum32     = Get-FileHash $dest -Algorithm SHA512 | % Hash
    ChecksumType32 = 'sha512'
  }
  Remove-Item -Force $dest

  return $result
}

function GetETagIfChanged() {
  param([string]$uri)
  if (($global:au_Force -ne $true) -and (Test-Path $PSScriptRoot\info)) {
    $existingETag = $etag = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -First 1 | % { $_ -split '\|' } | select -first 1
  }
  else { $existingETag = $null }

  $etag = Invoke-WebRequest -Method Head -Uri $uri -UseBasicParsing
  $etag = $etag | % { $_.Headers.ETag }

  if ($etag -eq $existingETag) { return $null }

  return $etag
}

function global:au_GetLatest {  
  $downloadUrl = 'http://www.flash-decompiler.com/download/flash_decompiler.exe'
  $etag = GetETagIfChanged -uri $downloadUrl

  if ($etag) {    
    $result = GetResultInformation $downloadUrl
    $result["ETAG"] = $etag
  }
  else {
    $result = @{
      URL32   = $downloadUrl
      Version = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -First 1 | % { $_ -split '\|' } | select -Last 1
    }
  }

  return $result
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
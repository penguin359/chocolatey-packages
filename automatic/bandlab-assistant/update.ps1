$ErrorActionPreference = 'Stop'
Import-Module au
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function global:au_GetLatest {
    $downloadUrl = 'https://www.bandlab.com/download/assistant/windows'
    $etag = GetETagIfChanged -uri $downloadUrl    

    If ($etag) {    
        $result = GetResultInformation $downloadUrl
        $result["ETAG"] = $etag
    } Else {    
        $result = @{
            URL32   = $downloadUrl
            Version = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -First 1 | % { $_ -split '\|' } | select -Last 1
        }
    }
    return $result
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_AfterUpdate {
  "$($Latest.ETAG)|$($Latest.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
}

function GetResultInformation([string]$url32) {
  $dest = "$env:TEMP\bandlab-assistant-windows-latest.exe"
  Get-WebFile $url32 $dest | Out-Null

  $result = @{
    URL32          = $url32
    Version        = (Get-Item $dest).VersionInfo.ProductVersion.Trim()
    Checksum       = Get-FileHash $dest -Algorithm SHA512 | % Hash
    ChecksumType32 = 'sha512'
  }
  Remove-Item -Force $dest
  return $result
}

function GetETagIfChanged() {
  param([string]$uri)
  If (($global:au_Force -ne $true) -and (Test-Path $PSScriptRoot\info)) {
    $existingETag = $etag = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -First 1 | % { $_ -split '\|' } | select -first 1
  }
  Else { $existingETag = $null }

  $etag = Invoke-WebRequest -Method Head -Uri $uri -UseBasicParsing
  $etag = $etag | % { $_.Headers.ETag }
  If ($etag -eq $existingETag) { return $null }

  return $etag
}

If ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update
}

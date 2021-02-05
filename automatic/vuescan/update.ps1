$ErrorActionPreference = 'Stop'
Import-Module au
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum $($Latest.URL32)
    $Latest.Checksum64 = Get-RemoteChecksum $($Latest.URL64)
}

function global:au_GetLatest {    
    $releases     = 'https://www.hamrick.com/alternate-versions.html'    
    $regex32      = '<a href="(?<File32>files/vuex32\d+.exe)">[\d\.]+</a>'
    $regex64      = '<a href="(?<File64>files/vuex64\d+.exe)">(?<Version>[\d\.]+)</a>'

    $download_page = (Invoke-WebRequest -Uri $releases).RawContent
    $download_page -match $regex32 | Out-Null
    $file32  = $matches.File32
    $download_page -match $regex64 | Out-Null
    $file64  = $matches.File64

    $etag = GetETagIfChanged -uri "https://www.hamrick.com/$file32"

    if ($etag) {        
        $result = GetResultInformation "https://www.hamrick.com/$file32" "https://www.hamrick.com/$file64"
        $result["ETAG"] = $etag
    }
    else {        
        $result = @{
            URL32   = 'https://www.hamrick.com/' + $file32
            URL64   = 'https://www.hamrick.com/' + $file64
            Version = $matches.Version
        }
    }
    return $result
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"        = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`${1}'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }
    }
}

function global:au_AfterUpdate {
  "$($Latest.ETAG)|$($Latest.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
}

function GetResultInformation([string]$url32, [string]$url64) {
  $dest = "$env:TEMP\vuex32.exe"
  Get-WebFile $url32 $dest | Out-Null  

  $result = @{
    URL32          = $url32
    URL64          = $url64
    Version        = (Get-Item $dest).VersionInfo.FileVersion.Trim()
    Checksum       = Get-FileHash $dest -Algorithm SHA512 | % Hash    
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

update -ChecksumFor none -NoCheckUrl
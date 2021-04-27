$ErrorActionPreference = 'Stop'
Import-Module au
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function global:au_GetLatest {
    $downloadUrl32 = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex_x86.msi'
    $downloadUrl64 = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
    $etag = GetETagIfChanged -uri $downloadUrl64

    If ($etag) {        
        $result = GetResultInformation $downloadUrl32 $downloadUrl64
        write-host ($result | Format-Table | Out-String)
        $result += @{ETAG=$etag}
    } Else {    
        $result = @{
            URL32   = $downloadUrl32
            URL64   = $downloadUrl64
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
            "(^(\s)*url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_AfterUpdate {
  "$($Latest.ETAG)|$($Latest.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
}

function GetVersion([string]$dest) {
  $Installer = New-Object -com WindowsInstaller.Installer
  $Database = $Installer.GetType().InvokeMember("OpenDatabase", "InvokeMethod", $Null, $Installer, $( $dest,0))
  $SummaryInfo = $Database.GetType().InvokeMember("SummaryInformation", "GetProperty",$Null , $Database, $Null)  
  $buff = $SummaryInfo.GetType().InvokeMember("Property", "GetProperty", $Null, $SummaryInfo, 6)  
  $version = (Get-Variable -ValueOnly ("buff")) -Replace 'Version: ([\d\.]+)','$1'  
  [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Installer)
  [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Database)
  [System.Runtime.Interopservices.Marshal]::ReleaseComObject($SummaryInfo)
  Remove-Variable Installer, Database, SummaryInfo  
  return $version
}

function GetResultInformation([string]$url32, [string]$url64) {
  $dest64 = "$env:TEMP\webex.msi"
  Get-WebFile $url64 $dest64 | Out-Null  
  $version = $(GetVersion "$dest64")
  $version = ($version -split '\r?\n')[3]
  $checksum64 = Get-FileHash $dest64 -Algorithm SHA256 | % Hash

  $dest32 = "$env:TEMP\webex_x86.msi"
  Get-WebFile $url32 $dest32 | Out-Null    
  $checksum32 = Get-FileHash $dest32 -Algorithm SHA256 | % Hash


  $result = @{
    URL32          = $url32
    Checksum32     = $checksum32
    URL64          = $url64
    Checksum64     = $checksum64
    Version        = $version
    ChecksumType   = 'sha256'
    ChecksumType64 = 'sha256'
  }
  
  Remove-Item -Force $dest32
  Remove-Item -Force $dest64
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

update -NoCheckUrl
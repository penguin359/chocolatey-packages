$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    $github_repository = 'mifi/lossless-cut'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex    = $github_repository + '/tree/v(?<Version>[\d\.]+)$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page.links | ? href -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://github.com/mifi/lossless-cut/releases/download/v' + $matches.Version +'/LosslessCut-win.zip'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none -noCheckUrl
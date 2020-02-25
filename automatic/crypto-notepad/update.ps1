$ErrorActionPreference = 'Stop'
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github     = 'https://github.com/'
    $repository = 'Crypto-Notepad/Crypto-Notepad'
    $file       = '/Crypto.Notepad.7z'

    $github_repository = $github + $repository
    $releases = $github_repository + '/releases/latest'
    $regex    = '/tree/v(?<Version>[\d\.]+)'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $version
        URL32   = $github_repository + '/releases/download/v' + $version + $file
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
        }
    }
}

update -ChecksumFor none
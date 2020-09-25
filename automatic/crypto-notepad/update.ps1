$ErrorActionPreference = 'Stop'
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github     = 'https://github.com/'
    $repository = 'Crypto-Notepad/Crypto-Notepad'
    $regexUrl   = '.*/Crypto.Notepad.(7z|zip)'

    $github_repository = $github + $repository
    $releases = $github_repository + '/releases/latest'
    $regex    = '/tree/v(?<Version>[\d\.]+)'

    $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $download_page | ? href -match $regex | Out-Null
    $version = $matches.Version
    $path = ($download_page | ? href -match $regexUrl).href

    return @{
        Version = $version
        URL32   = 'https://github.com/' + $path
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
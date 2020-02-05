$ErrorActionPreference = 'Stop'
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases     = 'https://github.com/mirinsoft/debotnet/releases/latest'
    $regexVersion = '/mirinsoft/debotnet/tree/(?<Version>[\d\.]+)'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regexVersion	| Out-Null
    $version = $matches.Version

    return @{
        Version = $version
        URL32   = 'https://github.com/mirinsoft/debotnet/releases/download/' + $version + '/debotnet.zip'
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

        "tools\chocolateyInstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
        }
    }
}

update -ChecksumFor none
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://download.kde.org/stable/labplot/'
    $regexLastMajorVersion = '<a href="(?<Version>[\d\.]+)/">'
    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links |? href -match '^([\d\.]+)/' | Select -Last 1 | Out-Null
    $majorVersion = $matches.1

    $releases = 'https://download.kde.org/stable/labplot/' + $majorVersion + '/labplot-' + $majorVersion + '-64bit-setup.exe.mirrorlist'
    $regex    = 'labplot-(?<Version>[\d\.]+)-64bit-setup.exe'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -First 1
    $version = $matches.Version

    return @{
        Version = $majorVersion
        URL32   = Get-RedirectedUrl ('https://download.kde.org/stable/labplot/' + $majorVersion + '/labplot-' + $majorVersion + '-64bit-setup.exe')
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor 64
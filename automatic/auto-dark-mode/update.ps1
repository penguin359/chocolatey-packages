import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'Armin2208/Windows-Auto-Night-Mode'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    #$regexVersion = 'Armin2208/Windows-Auto-Night-Mode/tree/(?<Version>[\d\.]+)'
    $regexVersion = 'Auto Dark Mode ?(Version) (?<Version>[\d\.]+)'
    #$regexUrl = '/.*AutoDarkMode.*\.zip'
    $regexUrl = '/.*AutoDarkMode.*\.exe'

    $download_page = (Invoke-WebRequest -Uri $releases).RawContent
    $download_page -match $regexVersion | Out-Null
    $version = $matches.Version
    $download_page -match $regexUrl | Out-Null
    $path = $matches.0

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

        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
        }
    }
}

update -ChecksumFor none
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://www.softwareok.com/?seite=Microsoft/DontSleep'
    $regex    = "<title>Don't Sleep (?<Version>[\d\.]+) Prevent Shutdown, Stand By, Turn Off, Restart</title>"

    (Invoke-WebRequest -Uri $releases) -match $regex | out-null
     return @{
        Version = $matches.Version
        URL32 = 'https://www.softwareok.com/Download/DontSleep.zip'
        URL64 = 'https://www.softwareok.com/Download/DontSleep_x64.zip'
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none
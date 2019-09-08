import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/bs1770gain/files/bs1770gain/'
    $regex   = 'bs1770gain-(?<Version>[\d\.]+)-win32.7z'

    (Invoke-WebRequest -Uri $releases).Content -match $regex | Select -First 1
    $version = $matches.Version

    return @{
        Version = $version
        URL32   = 'https://iweb.dl.sourceforge.net/project/bs1770gain/bs1770gain/' +$version + '/bs1770gain-' + $version + '-win32.7z'
        URL64   = 'https://iweb.dl.sourceforge.net/project/bs1770gain/bs1770gain/' +$version + '/bs1770gain-' + $version + '-win64.7z'
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
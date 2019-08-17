import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/davmail/files'
    $regex    = 'davmail-(?<Version>[\d\.-]+)-setup.exe'

    (Invoke-WebRequest -Uri $releases) -Match $regex | out-null
    $version      = $matches.Version
    $majorVersion = $version -Split '-' | Select -First 1

     return @{
        Version = $matches.Version -Replace '-', '.'
        URL32   = 'https://netcologne.dl.sourceforge.net/project/davmail/davmail/' + $majorVersion + '/davmail-' + $version + '-setup.exe'
        URL64   = 'https://netcologne.dl.sourceforge.net/project/davmail/davmail/' + $majorVersion + '/davmail-' + $version + '-setup64.exe'
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

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
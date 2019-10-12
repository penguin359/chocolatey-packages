import-module au

function global:au_GetLatest {
    $releases = 'https://altcopy.net/versionPC'
    $version  = ((Invoke-WebRequest -uri $releases).RawContent.Split([Environment]::NewLine) | Select -Last 1) -Replace '\.000$', ''

    return @{ Version = $version ; URL32 = 'https://altcopy.net/setup.exe' }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
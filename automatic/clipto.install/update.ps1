$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $github_repository = 'clipto-pro/Desktop'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex    = 'clipto-(?<Version>[\d\.]+).exe'

    $url     = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links |? href -match $regex
    $version = $matches.Version

    return @{
        Version = $version
        URL32 = 'https://github.com' + $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update
}
$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = 'https://steelseries.com/engine'
    $regex   = '>Download Engine (?<Version>[\d\.]+)<'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing) -match $regex

    return @{
        Version = $matches.version
        URL32 = 'https://engine.steelseriescdn.com/SteelSeriesEngine' + $matches.Version + 'Setup.exe'
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

update
import-module au

function global:au_GetLatest {
    $releases = 'https://www.skytopia.com/software/sunsetscreen'
    $regex    = 'SunsetScreen v(?<Version>[\d\.]+)\<'

    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen.exe'
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
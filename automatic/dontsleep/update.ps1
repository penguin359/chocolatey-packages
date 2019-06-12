import-module au

function global:au_GetLatest {
	$releases = 'https://www.softwareok.com/?seite=Microsoft/DontSleep'
	$regex    = "<title>Don't Sleep (?<Version>[\d\.]+) Prevent Shutdown, Stand By, Turn Off, Restart</title>"

    (Invoke-WebRequest -Uri $releases) -match $regex | out-null

    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl
import-module au

function global:au_GetLatest {
	$releases = 'https://www.evga.com/precisionxoc'
	$regex    = "Version (?<Version>[\d\.]+)<\/h3>"

    (Invoke-WebRequest -Uri $releases) -match $regex | out-null

    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
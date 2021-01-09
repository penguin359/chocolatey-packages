import-module au

function global:au_GetLatest {
	$releases = 'https://12noon.com/?page_id=80'
	$regex    = '<p>(?<Version>[\d\.]+):\ '

    (Invoke-WebRequest -Uri $releases).Content -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://12noon.com/files/dc.zip'
    }
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
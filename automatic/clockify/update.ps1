import-module au

function global:au_GetLatest {
	$releases = 'https://raw.githubusercontent.com/clockify/browser-extension/master/package.json'
	$regex    = '"version": "(?<Version>[\d\.]+)",'

    (Invoke-WebRequest -Uri $releases).Content -match $regex

    return @{
        Version = $matches.Version
        URL32   = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
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
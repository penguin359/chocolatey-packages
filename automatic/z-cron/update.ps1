import-module au

function global:au_GetLatest {
    $releases = 'https://www.z-cron.com/download.html'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	 
	$regex   = '<td class="boxe">(?<Version>[\d\.]+) Build (?<Build>\d+) \('

	$download_page.Content -match $regex | Out-Null
	if ($matches.Build) {
	   $version = $matches.Version + "." + $matches.Build
	} else {
	   $version = $matches.Version
	}
	return @{
        Version = $version
        URL32   = 'https://www.z-download.de/down/zcron.zip'        
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update -checksumfor none
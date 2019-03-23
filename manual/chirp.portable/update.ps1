import-module au
$releases = "https://trac.chirp.danplanet.com/chirp_daily/LATEST/"

function global:au_GetLatest {	
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	 
	 $regex   = '^chirp-daily-(?<date_url>\d+)-win32.zip$'
	 $download_page.links | ? href -match $regex
	 $version_YY = $matches.date_url.substring(0, $matches.date_url.length-4)
	 $version_MM = $matches.date_url.substring($matches.date_url.length-4, 2)
	 $version_DD = $matches.date_url.substring($matches.date_url.length-2)
	 $version = $version_YY + "." + $version_MM + "." + $version_DD
     return @{ Version = $version ; URL32 = $releases + "chirp-daily-" + $matches.date_url + "-win32.zip" }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
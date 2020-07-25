import-module au

function global:au_GetLatest {	
	$releases = "https://www.klayout.de/build.html"
	$regex_32 = "klayout-(?<Version>[\d\.]+)-win32-install.exe$"
	$regex_64 = "klayout-([\d\.]+)-win64-install.exe$"

	$download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
	$url_32   = $download_page | ? href -match $regex_32 | Select -First 1
	$version  = $matches.Version
	$url_64   = $download_page | ? href -match $regex_64 | Select -First 1

	return @{
		Version = $version
		URL32   = $url_32.href
		URL64   = $url_64.href
	}
}

function global:au_SearchReplace {
	@{
		"tools\chocolateyInstall.ps1" = @{
        	"(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
			"(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
			"(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
			"(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update
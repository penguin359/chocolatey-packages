import-module au

$releases = 'http://www.log4om.com/dl/'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = '\.zip$'
	 $regex_version = "Actual Version is (.*?)<"
	 $url = $download_page.links | ? href -match $regex | select -Last 1 -expand href
	 $download_page -match $regex_version
	 return @{ Version = $matches[1] ; URL32 = $url }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
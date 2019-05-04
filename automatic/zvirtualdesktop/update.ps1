import-module au
$github_repository = "mzomparelli/zVirtualDesktop"
$releases          = "https://github.com/" + $github_repository + "/releases/latest"
$regex_version     = "/archive/(?<Version>[\d\.]+).zip$"
$regex_url         = "^(https://zomp.co/Files.aspx\?id=.*)$"

function global:au_GetLatest {	
	(Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex_version | Out-Null
    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex_url
	return @{ Version = $matches.Version ; URL32 = $url.href }
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
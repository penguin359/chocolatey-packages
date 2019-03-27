import-module au
$releases = "https://mirillis.com/download-splash-free-hd-video-player"

function global:au_GetLatest {	
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing     
	 $regex    = '/splash_(?<Version>.*)_setup.exe$'     
	 $url      = $download_page.links | ? href -match $regex
     $version  = $matches.Version -replace "_", "."
     return @{ Version = $version ; URL32 = $url.href }
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
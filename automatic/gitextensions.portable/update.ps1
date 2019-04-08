import-module au
$github_repository = "gitextensions/gitextensions"
$releases = "https://github.com/" + $github_repository + "/releases/latest"

function global:au_GetLatest {	
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
     # Note: Version of the downloaded file is like "w.x.y.z" but we keep only "w.x.y"
	 $regex   = $github_repository + '/releases/download/.*/GitExtensions-Portable-(?<Version>[\d\.]+)\.\d+[\w-]*.zip'
	 $url = $download_page.links | ? href -match $regex     
     return @{ Version = $matches.Version ; URL32 = "https://github.com" + $url.href }
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
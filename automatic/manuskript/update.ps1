import-module au
$github_repository = "olivierkes/manuskript"
$releases = "https://github.com/" + $github_repository + "/releases/latest"

function global:au_GetLatest {	
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = $github_repository + '/releases/download/.*/manuskript-([\d\.-]*)-win32.zip'
	 $url = $download_page.links | ? href -match $regex
     $url.href[0] -match "manuskript-(?<Version>[\d\.-]*)-win32.zip"

     return @{ Version = $matches.Version -Replace "-", "." ; URL32 = $url.href[0] }
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

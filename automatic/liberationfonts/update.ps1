import-module au
$github_repository = "liberationfonts/liberation-fonts"
$releases = "https://github.com/" + $github_repository + "/releases/latest"
$regex   = "^https://github.com/" + $github_repository + "/files/.*/liberation-fonts-ttf-(?<Version>[\d\.]+).tar.gz$"

function global:au_GetLatest {	
     $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
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
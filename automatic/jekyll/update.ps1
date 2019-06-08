import-module au

function global:au_GetLatest {	
	$releases = "https://jekyllrb.com"
	$regex    = "Jekyll v(?<Version>[\d\.]+)"

	(Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

	return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
	@{
		"tools\chocolateyInstall.ps1" = @{
        	"(^(\s)*gem install bundler jekyll -v )[\d\.]+.*" = "`$1`$(`$Latest.Version)"
        }
    }
}

#update
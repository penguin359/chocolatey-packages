import-module au

function global:au_GetLatest {
    $releases = "https://jekyllrb.com"
    $regex    = "Jekyll v(?<Version>[\d\.]+)"

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null    
    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {    
    @{
	   "tools\chocolateyinstall.ps1" = @{            
        "(gem install jekyll -v)\s*[\d\.]+.*" = "`$1 $($Latest.Version)"
        }
    }
}

update -ChecksumFor none -noCheckUrl
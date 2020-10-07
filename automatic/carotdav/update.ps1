import-module au

function global:au_GetLatest {
    $releases = 'http://rei.to/carotdav_en.html'
    $regex    = 'CarotDAV(?<Version>[\d\.]+).zip$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page.links | ? href -match $regex | Select -First 1 | Out-Null
	 
     return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).portable`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""            
        }
    }
}

update

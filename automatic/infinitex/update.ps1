import-module au

function global:au_GetLatest {	
    $github_repository = "fetacore/Infinitex"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex    = 'InfiniTex-Setup-(?<Version>[\d\.]+).exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	
	$url = $download_page.links | ? href -match $regex

    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{        
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update
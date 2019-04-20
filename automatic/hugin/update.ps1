import-module au
$releases = 'http://hugin.sourceforge.net/download'
$regex = "https://sourceforge.net/projects/hugin/files/hugin/hugin-[\d\.]+/Hugin-(?<Version>[\d\.]+)-win64.msi/download"

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	 
	 $url = $download_page.links | ? href -match $regex	 
     return @{ Version = $matches.Version ; URL32 = $url.href }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{         
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }        
    }
}

update
import-module au

$releases = 'http://www.log4om.com/dl/'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = '\.zip$'
	 $regex_version = "Actual Version is (.*?)<"
	 $url = $download_page.links | ? href -match $regex | select -First 1 -expand href
	 $download_page -match $regex_version
	 return @{ Version = $matches[1]}
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl
import-module au

$releases = 'http://www.ei5di.com'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = '<a href="http://www.ei5di.com/sdhist.html"><b>V(?<version_url>.*)</b></a>'
	 $download_page -match $regex
	 #$version = $matches.Version_url -replace '([\d.]+?)([a-z]+)','$1-$2'
	 $version = $matches.Version_url -replace '([\d.]+?)(a-z]+','$1'
     return @{ Version = $version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
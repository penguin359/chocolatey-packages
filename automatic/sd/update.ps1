import-module au

$releases = 'http://www.ei5di.com'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = '<a href="http://www.ei5di.com/sdhist.html"><b>V(.*)</b></a>'
	 $version = $download_page -match $regex
     return @{ Version = $matches[1] }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
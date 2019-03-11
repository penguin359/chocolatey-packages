import-module au

$releases = 'http://www.winlog32.co.uk/dl_wl32update.htm'
$url = 'http://www.winlog32.co.uk/files/'
http://www.winlog32.co.uk/files/wl32v73.exe


function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = 'v(.*?) \(rev'
	 $download_page -match $regex
	 $version = $matches[1]
	 $version_url = $version.replace('.','')
     return @{ Version = $version ; URL32 = $url + "wl32v" + $version_url + ".exe" }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
import-module au
$releases = "https://github.com/botpress/botpress/releases"
$releases_download = "https://s3.amazonaws.com/botpress-binaries/"
$regex   = ' <a href="/botpress/botpress/releases/tag/v(?<Version>[\d\.]*)">'   

function global:au_GetLatest {
	$download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing) -match $regex
	$version_download = $matches.Version -replace "\.", "_"
	return @{ Version = $matches.Version ; URL = $releases_download + "botpress-v" + $version_download + "-win-x64.zip" ; zipFileName = "botpress-v" + $version_download + "-win-x64.zip" }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }    
        "tools\chocolateyuninstall.ps1" = @{
            '(.*zipFileName\s*=\s*)(".*")' = "`$1`"$($Latest.zipFileName)`""
        }
    }
}

update
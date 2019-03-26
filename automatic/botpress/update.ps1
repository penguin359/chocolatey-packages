import-module au
$releases = "https://raw.githubusercontent.com/botpress/botpress/master/CHANGELOG.md"
$releases_download = "https://s3.amazonaws.com/botpress-binaries/"

function global:au_GetLatest {	
	$download_page = Invoke-WebRequest -Uri $releases
	$regex   = '\[(?<Version>[\d\.]*)\]'
	$download_page -match $regex
	$version_download = $matches.Version -replace "\.", "_"	 
    $zipFileName = "botpress-v" + $version_download + "-win-x64.zip"
	return @{ Version = $matches.Version ; URL = $releases_download + $zipFileName ; zipFileName = $zipFileName }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
    }
    @{
        "tools\chocolateyuninstall.ps1" = @{
            "^(\s)*\$zipFileName\s*=\s*)('.*')" = "`$1'$($Latest.zipFileName)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
    }
    $zipFileName = "botpress-v11_7_1-win-x64.zip"
}

update
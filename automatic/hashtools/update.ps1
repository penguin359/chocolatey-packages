import-module au

$releases = 'https://www.binaryfortress.com/HashTools/Download'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases
	 $regex   = 'Latest Version:</b> v([^ ]+) \('
	 $download_page -match $regex
	 $version = $matches[1]
     return @{ Version = $version ; URL32 = "https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-$version.exe" }
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
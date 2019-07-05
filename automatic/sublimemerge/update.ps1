import-module au

function global:au_GetLatest {
    $releases = 'https://www.sublimemerge.com/download'
    $regex = "https://download.sublimetext.com/sublime_merge_build_(?<Version>[\d]+)_x64_setup.exe"

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	 
	$url = $download_page.links | ? href -match $regex | select -Last 1	 

    return @{
       Version = "0.0." + $matches.Version
       URL32 = $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
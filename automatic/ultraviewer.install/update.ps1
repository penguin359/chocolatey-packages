$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$releases = 'https://ultraviewer.net/en/download.html'
	$regex    = 'UltraViewer_setup_(?<Version>[\d\.]+)_en.exe'
	
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex | select -Last 1

    return @{
        Version = $matches.Version
        URL32   = 'https://ultraviewer.net/en/' + $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update
}
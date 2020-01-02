$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases     = 'https://www.ne.jp/asahi/foresth/home/'
    $regexVersion = 'RotPDF Ver(?<Version>[\d\._]+)'
	$regex        = 'rpdf(?<Version>[\d\._]+).zip'
 
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex | select -Last 1

    $HTML = New-Object -Com "HTMLFile"
    $HTML.IHTMLDocument2_write($download_page.Content)
    ($HTML.all.tags("strong") |% InnerText | Out-String) -match $regexVersion | Out-Null

     return @{ Version = $matches.Version ; URL32 = $releases + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases     = 'http://www.ne.jp/asahi/foresth/home/'
    $releases_en  = $releases + 'indexe.htm'
	$regexURL     = 'cpdfc([\d]+).zip'
    $regexVersion = 'ComPDF Console Ver(?<Version>[\d.]+)'

    $HTML = New-Object -Com "HTMLFile"
    $HTML.IHTMLDocument2_write($download_page.Content)
    ($HTML.all.tags("strong") |% InnerText | Out-String) -match $regexVersion | Out-Null
    $version = $matches.Version

    $download_page = Invoke-WebRequest -Uri $releases_en -UseBasicParsing
	$url = $download_page.links | ? href -match $regexURL | select -First 1

    return @{
        Version = $version
        URL32   = $releases + $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update

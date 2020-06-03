$ErrorActionPreference = 'Stop'
Import-Module au

function global:au_BeforeUpdate {
    $releases     = 'https://www.ne.jp/asahi/foresth/home/'    
    $regexVersion = 'SepPDF Ver(?<Version>[\d\.]+)'
    $regex        = 'spdf([\d\._]+).zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | ? href -match $regex | Select -First 1

    $Latest.URL32 = $releases + $url.href
    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32     = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
  }

function global:au_GetLatest {
    $releases     = 'https://www.ne.jp/asahi/foresth/home/'    
    $regexVersion = 'SepPDF Ver(?<Version>[\d\.]+)'
	$regex        = 'spdf([\d\._]+).zip'

	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$download_page.links | ? href -match $regex | Select -First 1 | Out-Null   
    $HTML = New-Object -Com "HTMLFile"
    $HTML.IHTMLDocument2_write($download_page.Content)
    ($HTML.all.tags("strong") |% InnerText | Out-String) -match $regexVersion | Out-Null

    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none
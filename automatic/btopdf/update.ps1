$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
     $releases     = 'http://www.ne.jp/asahi/foresth/home/indexe.htm'
     $regex        = 'bpdf[\d.]+.zip$'
	 $regexVersion = 'BtoPDF</a> Ver(?<Version>[\d\._]+) '

	 $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $url = $download_page.links | ? href -match $regex
     $download_page.Content -match $regexVersion | Out-Null

     return @{ Version = $matches.Version ; URL32 = 'http://www.ne.jp/asahi/foresth/home/' + $url.href }
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
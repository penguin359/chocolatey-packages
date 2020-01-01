$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
     $releases     = 'http://www.ne.jp/asahi/foresth/home/indexe.htm'
	 $regexVersion = 'ComPDF</a> 
        Ver(?<Version>[\d\._]+)'
     $regex = 'cpdf[\d.]+.zip'

	 $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $url = $download_page.links | ? href -match $regex | Select -First 1
     $download_page.Content -match $regexVersion

     return @{ Version = $version ; URL32 = 'http://www.ne.jp/asahi/foresth/home/' + $url.href }
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

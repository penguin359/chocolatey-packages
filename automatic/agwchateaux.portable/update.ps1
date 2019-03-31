import-module au

$releases = 'http://f1agw.free.fr/AGW_Chateaux/JEC.htm'

function global:au_GetLatest {
    http://f1agw.free.fr/AGW_Chateaux/AGW_Chateaux_177_SI.zip
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = '\/AGW_Chateaux_(?<Version>[\d]+)_SI.zip$'
	 $url = $download_page.links | ? href -match $regex
     $version = ($matches.Version -replace "(\d)","`$1.").substring(0, $matches.Version.length +2 )	      
     return @{ Version = $version ; URL32 = $url.href }
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
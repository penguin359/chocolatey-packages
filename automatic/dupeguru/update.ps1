import-module au

function global:au_GetLatest {
    $releases = "https://dupeguru.voltaicideas.net"
    $regex    = "/dupeGuru_win64_(?<Version>[\d\.]+).exe$"

	$url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex

	return @{ Version = $matches.Version ; URL32 = $url.href }
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
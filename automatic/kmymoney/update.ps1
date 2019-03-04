import-module au

$releases = 'https://kmymoney.org/'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 #<a href="https://download.kde.org/stable/kmymoney/4.8.3/">4.8.3 for your Windows PC</a>
	 $regex   = '\.exe$'
	 $url = $download_page.links | ? href -match $regex | select -Last 1
	 $version = $url -split '-|.exe' | select -Last 1 -Skip 3
     return @{ Version = $version ; URL32 = $releases+$url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

##### OFF update
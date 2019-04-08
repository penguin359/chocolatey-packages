import-module au
$projectUrl = 'http://www.texts.io'
$releases = $projectUrl + '/download/'
$regex = '(?<File>\/Texts-(?<Version>[\d\.]*).msi)$'

function global:au_GetLatest {
     $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
     return @{ Version = $matches.Version ; URL32 = $projectUrl + $matches.File }
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
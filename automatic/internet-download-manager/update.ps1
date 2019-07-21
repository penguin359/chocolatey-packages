import-module au

function global:au_GetLatest {
    $releases = 'http://www.internetdownloadmanager.com/download.html'    
    $regex    = 'idman(?<VersionMajor>[\d])(?<VersionMinor>[\d]+)build(?<Build>[\d]+)\.exe'

    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -First 1
    $version = $matches.VersionMajor + '.' + $matches.VersionMinor + '.' + $matches.Build

    return @{ Version = $version ; URL32 = $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
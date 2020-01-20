import-module au

function global:au_GetLatest {
    $releases = 'https://www.buffalotech.com/support'
    $regex    = 'nasnavi-(?<VersionFile>(?<VersionMajor>\d)(?<VersionMinor>\d(\d|[a-z]))).zip$'

    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
    $versionFile = $matches.VersionFile

    $version     = $matches.VersionMajor + '.' + $matches.VersionMinor
    if ($version -eq '2.9b') { $version = '2.911' }

    return @{
        Version     = $version
        VersionFile = $matches.VersionFile
        URL         = $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "([$]toolsDir\\nasnavi-)[\da-z]+(\\NASNaviInst.exe)" = "`${1}$($Latest.VersionFile)`${2}"
        }
    }
}

update
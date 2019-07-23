import-module au

function global:au_GetLatest {
    $releases = 'https://www.buffalotech.com/support'
    $regex    = 'nasnavi-(?<VersionFile>(?<VersionMajor>\d)(?<VersionMinor>\d\d)).zip$'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null

    return @{
        Version     = $matches.VersionMajor + '.' + $matches.VersionMinor
        VersionFile = $matches.VersionFile
        URL         = $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "([$]toolsDir\\nasnavi-)\d+(\\NASNaviInst.exe)" = "`${1}$($Latest.VersionFile)`${2}"
        }
    }
}

update
import-module au

function global:au_GetLatest {
    $releases = 'https://www.perforce.com/products/helix-alm/release-notes'
    $regex    = '>Helix ALM (?<Version>[\d\.]+)<'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex
    $version = $matches.Version

    return @{
        Version = $version
        URL32   = 'https://cdist2.perforce.com/alm/helixalm/r' + $version + '/ttwinclientinstall.exe'        
    }
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
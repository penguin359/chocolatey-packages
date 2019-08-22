import-module au

function global:au_GetLatest {
    $releases = 'https://community.jaspersoft.com/project/jaspersoft-studio/releases'
    $regex    = 'TIB_js-studiocomm_(?<Version>[\d\.]+)_windows_x86_64.exe'

    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $version
        URL64   = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-' + $version + '/TIB_js-studiocomm_' + $version + '_windows_x86_64.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor 64
import-module au

function global:au_GetLatest {
    $releases = 'https://community.jaspersoft.com/project/jaspersoft-studio/releases'
    $regex    = 'TIB_js-studiocomm_(?<Version>[\d\.]+)_windows_x86_64.exe'

    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $version       
    }
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl
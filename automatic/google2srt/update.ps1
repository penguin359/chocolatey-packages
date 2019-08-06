import-module au

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/google2srt/files/Google2SRT'
    $regex    = 'google2srt-(?<Version>[\d\.]+).msi'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
    }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{         
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update
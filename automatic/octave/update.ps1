import-module au

function global:au_GetLatest {
    $releases = 'https://ftp.gnu.org/octave/windows/'
    $regex32  = 'octave-(?<Version>[\d\.]+)-w32-installer.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32         = $download_page.links | ? href -match $regex32 | select -Last 1
    $version       = $matches.Version

    return @{ Version = $version }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl
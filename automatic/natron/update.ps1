import-module au

function global:au_GetLatest {
    $github_repository = 'NatronGitHub/Natron'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex    = 'Natron-(?<Version>[\d\.]+)-Windows-x86_32bit-setup.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url      = $download_page.links | ? href -match $regex | select -First 1
    $version  = $matches.Version

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
import-module au

$releases = 'https://www.kdevelop.org/download'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
     $regex   = 'kdevelop-(?<Version>[\d\.]+)-x64-setup.exe$'
     $download_page.links | ? href -match $regex | Select -First 1 | Out-Null
     $version = $matches.Version
     $versionRelease = $version -Replace "\.", ""

     return @{ Version = $version ; VersionRelease = $matches.versionRelease }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "<releaseNotes>https://www.kdevelop.org/news/kdevelop-(.*?)-released</releaseNotes>" = "<releaseNotes>https://www.kdevelop.org/news/kdevelop-$($Latest.VersionRelease)-released</releaseNotes>"
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""            
        }
    }
}

update

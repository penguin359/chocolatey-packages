import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'http://speedcrunch.org/download.html'    
    $regex    = 'SpeedCrunch-(?<Version>[\d\.]+)-win32.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page.links | ? href -match $regex | Out-Null

    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl
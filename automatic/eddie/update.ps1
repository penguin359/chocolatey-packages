import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_GetLatest {
    $github_repository = 'AirVPN/Eddie'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'    
    $regex    = 'v(?<Version>[\d\.]+).zip$'

    $url     = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex  

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
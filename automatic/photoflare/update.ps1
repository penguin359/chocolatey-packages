$ErrorActionPreference = 'Stop'
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_GetLatest {
    $releases = 'https://launchpad.net/photofiltre-lx'
    $regex    = 'Photoflare_CE_(?<Version>[\d\.]+)_amd64.msi'    

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null

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
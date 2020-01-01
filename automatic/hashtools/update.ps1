$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = Get-RedirectedUrl 'https://www.binaryfortress.com/Data/Download/?package=hashtools&log=100'
    $regex    = 'HashToolsSetup-(?<Version>[\d.]+)(?<VersionLetter>[a-z]+).exe$'

    $releases -match $regex | Out-Null
    $version = $matches.Version

     if ($matches.VersionLetter) {
        $version = $version + '.' + ( [int][char]$matches.VersionLetter - 96 )
    }

    return @{
        Version = $version
        URL32   = $releases
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update -noCheckurl

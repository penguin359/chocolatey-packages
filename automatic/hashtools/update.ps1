import-module au

function global:au_GetLatest {
    $releases = Get-RedirectedUrl 'https://www.binaryfortress.com/Data/Download/?package=hashtools&log=100'
    $regex    = 'HashToolsSetup-(?<Version>[\d.]+).exe$'

    $releases -match $regex | Out-Null

    return @{
        Version = $matches.Version
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
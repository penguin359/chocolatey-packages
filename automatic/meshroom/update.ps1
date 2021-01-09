import-module au

function global:au_GetLatest {
    $github_repository = 'alicevision/meshroom'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex    = '[/=]Meshroom-(?<Version>[\d\.]+)-win64.zip$'

    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex

    return @{ Version = $matches.Version ; URL32 = $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"            
            "([$]toolsDir `"Meshroom-)[\d\.]+(.*)`"" = "`${1}$($Latest.Version)`${2}`""
        }
    }
}

update -ChecksumFor 64
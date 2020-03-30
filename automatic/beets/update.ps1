$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$github_repository = 'beetbox/beets'
	$releases = 'https://github.com/' + $github_repository + '/releases/latest'
	$regex    = '/beetbox/beets/tree/v(?<Version>[\d\.]+)'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regex | Out-Null

	return @{
		Version = $matches.Version
	}
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*[$]version\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
        }        
    }
}

update -ChecksumFor none -NoCheckUrl

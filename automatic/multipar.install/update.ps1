import-module au

function global:au_GetLatest {
    $releases = 'https://multipar.eu'
    $regex    = 'MultiPar(?<Version>[\d]+)_setup.exe$'

    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
    $version = $matches.Version -replace "(\d+)(\d)(\d)(\d)", '$1.$2.$3.$4'

    return @{ Version = $version + "00" ; URL32 = $releases + "/" + $url.href }
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
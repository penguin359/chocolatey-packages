import-module au

function global:au_GetLatest {
    $releases = 'https://myopenlab.org/inicio/descargar-myopenlab/'
    $regex = 'MyOpenLab v(?<Version>[\d\.]+)'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null
	
    return @{
        Version = $matches.Version
        URL32 = 'https://myopenlab.org/distribution_win64_java64_' + $matches.Version + '.zip'
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
import-module au

function global:au_GetLatest {
    $releases = 'https://www.eclipse.org/downloads/packages'
    $regex    = 'eclipse-java-(?<VersionUrl>(?<VersionYear>\d+)-(?<VersionMonth>\d+))-R-win32-x86_64.zip$' 

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null
	$version = $matches.VersionYear + '.' + $matches.VersionMonth

    return @{ Version = $version ; URL32 = 'https://ftp.halifax.rwth-aachen.de/eclipse//technology/epp/downloads/release/' + $matches.VersionUrl + '/R/eclipse-java-' + $matches.VersionUrl + '-R-win32-x86_64.zip' }
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
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_GetLatest {
    $releases = 'https://www.eclipse.org/downloads/packages'
    $regex    = 'eclipse-cpp-(?<VersionUrl>(?<VersionYear>\d+)-(?<VersionMonth>\d+))-R(-incubation)?-win32-x86_64.zip$'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null
	$version = $matches.VersionYear + '.' + $matches.VersionMonth

    return @{
        Version = $version        
        URL32   = 'http://ftp.fau.de/eclipse/technology/epp/downloads/release/' + $matches.VersionUrl + '/R/' + $matches.0        
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
import-module au

function global:au_GetLatest {
    $releases = 'https://physics.princeton.edu/pulsar/k1jt/wsjtx.html'
    $regex   = 'wsjtx-(?<Version>[\d\.]+)-win32.exe$'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null
	
    return @{
        Version = $matches.Version
        URL32   = 'https://physics.princeton.edu/pulsar/k1jt/' + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
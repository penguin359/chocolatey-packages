import-module au

function global:au_GetLatest {
    $releases = 'http://tonnesoftware.com/elsiedownload.html'
    $regex    = 'current version of Elsie is <b>(?<Version>[\d\.]+)</b> -'
    $regexURL = 'LCinstall\d+.exe$'

    (Invoke-WebRequest -Uri $releases).Content -match $regex
    $version = $matches.Version
    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regexURL

    return @{
        Version = $version
        URL32   = 'http://tonnesoftware.com/' + $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
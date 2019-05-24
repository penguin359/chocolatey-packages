import-module au

function global:au_GetLatest {
    $releases = 'https://voipcallrecording.com'
    $regex    = 'version=(?<Version>[\d\.]+)$'    
    
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url           = $download_page.links | ? href -match $regex | select -First 1
    $versionUrl    = $matches.Version -Replace '\.', ''

    return @{
        Version = $matches.Version
        URL32   = $releases + '/old/MP3SkypeRecorderSetup' + $versionUrl + '.msi'
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
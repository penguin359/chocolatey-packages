import-module au

$releases = 'http://download.remotehams.com/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

    #RCForbClientSetup_v0.9.319.exe
    $re    = 'RCForbClientSetup_v[0-9].*\.exe$'
    $url   = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version  = ($url -split '_v' | select -Last 1) -split '\.exe' | select -First 1

    @{
        URL32 = $url
        Version = $version
    }
}

update

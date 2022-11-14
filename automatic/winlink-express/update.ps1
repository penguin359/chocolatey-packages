import-module au

$baseUrl  = 'https://downloads.winlink.org'
$releases = $baseUrl + '/User%20Programs/'

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

    #Winlink_Express_install_1-7-2-0.zip
    $re    = 'Winlink_Express_install_.*zip$'
    $path  = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version  = (($path -split '_' | select -last 1) -split '\.' | select -first 1).replace('-', '.') + '00'

    @{
        URL32 = $baseUrl + $path
        Version = $version
    }
}

update

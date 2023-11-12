import-module au

$releases = 'https://www.arrl.org/tqsl-download'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        'trustedqsl.nuspec' = @{
            "(<releaseNotes>).*(</releaseNotes>)" = "`$1$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

    #tqsl-2.5.1.msi
    $re    = 'tqsl.*\.msi$'
    $url   = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version  = ($url -split '-' | select -Last 1) -split '\.msi' | select -First 1
    $releaseVersion = $version.replace('.', '-')

    $releaseNotesUrl = "https://www.arrl.org/files/file/LoTW%20Instructions/TrustedQSL-$releaseVersion-release.pdf"

    @{
        URL32 = $url
        Version = $version
        ReleaseNotes = $releaseNotesUrl
    }
}

update

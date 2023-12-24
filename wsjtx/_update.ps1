import-module au

$releases = 'https://www.arrl.org/tqsl-download'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        'wsjtx.nuspec' = @{
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

    $releaseNotesUrl = 'https://physics.princeton.edu/pulsar/K1JT/Release_Notes.txt'
    $page = Invoke-WebRequest -Uri $releaseNotesUrl -UseBasicParsing
    $start = $false
    $found = $false
    $lines = $page -split '\n' | %{
	    if ($_ -match ('Release:.* ' + $version)) {
		    $found = $true
	    } elseif ($found -and ($_ -match '----------')) {
		    $start = $true
	    } elseif($_ -match 'Release:') {
		    $start = $false
		    $found = $false
	    } elseif($start) {
		    echo $_.Trim("`r")
	    }
    }
    $releaseNotes = ($lines -join "`n").Trim()

    @{
        URL32 = $url
        Version = $version
        ReleaseNotes = $releaseNotes
    }
}

update

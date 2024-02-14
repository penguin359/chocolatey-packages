import-module au

$baseUrl  = 'https://wsjt.sourceforge.io/'
$releases = $baseUrl + 'wsjtx.html'

function global:au_AfterUpdate {
	$releaseNotes = $Latest.ReleaseNotes
	$content = (Get-Content -Encoding 'UTF8' 'wsjtx.nuspec') -join "`n"
	$output = $content -replace "(?s)(<releaseNotes><!\[CDATA\[).*(]]></releaseNotes>)","`$1${releaseNotes}`$2" -split "`n"
	$output | Out-File -Encoding 'UTF8' 'wsjtx.nuspec'
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

    #wsjtx-2.6.1-win64.exe
    $re    = 'wsjtx-[0-9].*-win64\.exe$'
    $path  = $download_page.links | ? href -match $re | select -First 1 -expand href

    $path32 = $path.replace('64', '32')

    $version  = ($path -split 'wsjtx-' | select -Last 1) -split '-win64\.exe' | select -First 1

    $releaseNotesUrl = "https://wsjt.sourceforge.io/wsjtx-doc/Release_Notes_${version}.txt"
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
        URL32 = $baseUrl + $path32
        URL64 = $baseUrl + $path
        Version = $version
        ReleaseNotes = $releaseNotes
    }
}

update

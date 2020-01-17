import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_GetLatest {
    $releases = 'https://voipcallrecording.com'
    $regex    = 'version=(?<Version>[\d\.]+)$'    
    
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url           = $download_page.links | ? href -match $regex | select -First 1    
    $version       = $matches.Version

    return @{
        Version = $version
        URL32   = 'http://download.mp3skyperecorder.com/MP3SkypeRecorderSetup.exe?version=' + $version
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

try {
    update
} catch {
    $ignore = 'The request was aborted: Could not create SSL/TLS secure channel.'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}
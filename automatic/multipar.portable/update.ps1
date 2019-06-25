import-module au

function global:au_BeforeUpdate { 
    $releases = 'https://multipar.eu'
    $regex    = 'MultiPar[\d]+.zip$'
    $url      = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex

    Invoke-WebRequest -Uri $url -Headers @{"referer"="https://multipar.eu"} -OutFile "${env:tmp}\multipar.zip" | Out-Null
    $Latest.Checksum32 = checksum -t sha256 "${env:tmp}\multipar.zip"
    $Latest.URL32 = $url

    Remove-Item -Path "${env:tmp}\multipar.zip"
}

function global:au_GetLatest {
    $releases = 'https://multipar.eu'
    $regex    = 'MultiPar(?<Version>[\d]+).zip$'
    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
    $version = $matches.Version -replace "(\d+)(\d)(\d)(\d)", '$1.$2.$3.$4'

    return @{ Version = $version + "00" }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -NoCheckUrl -ChecksumFor none
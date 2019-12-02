import-module au

function global:au_GetLatest {
    $releases = 'https://www.binaryfortress.com/HashTools/Download'
    $regex    = 'Latest Version:</b> v(?<Version>[^ ]+) \('

    (Invoke-WebRequest -Uri $releases -UseBasicParsing) -match $regex | Out-Null

    return @{
        Version = $matches.Vversion
        URL32   = get-redirectedurl 'https://www.binaryfortress.com/Data/Download/?package=hashtools&log=100'
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
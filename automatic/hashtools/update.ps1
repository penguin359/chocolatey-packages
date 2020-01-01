import-module au

function global:au_GetLatest {
    $releases = Get-RedirectedUrl 'https://www.binaryfortress.com/Data/Download/?package=hashtools&log=100'
    $regex    = 'HashToolsSetup-(?<Version>[a-z\d.]+).exe$'

    $releases -match $regex | Out-Null    
    $version = $matches.Version

    # If version is like "1.2c", replacing char by a value to obtain "1.2.3"
    $lastChar = ($version.Substring($version.Length-1));

    if ($lastChar -like "[a-z]") {
        $char_value = [byte][char]$lastchar - 96
        $version = $version -replace "$lastChar", ".$char_value"
    }

    return @{
        Version = $version
        URL32   = $releases
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update -noCheckurl
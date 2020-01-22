Import-Module au
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

function global:au_GetLatest {
    $releases = 'https://www.wintools.info/index.php/uptodate-downloader-changelog'
    $regex    = '>Version: (?<Version>[\d\.]*) \|'
    (Invoke-WebRequest -Uri $releases) -match $regex

    return @{ 
        Version = $matches.Version
        URL32   = 'https://www.wintools.info/Download/uptodatedl.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
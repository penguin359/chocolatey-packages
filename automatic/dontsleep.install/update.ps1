import-module au
import-module au
$releases = 'https://www.softwareok.com/?seite=Microsoft/DontSleep'
$regex = "<title>Don't Sleep (?<Version>[\d\.]+) Prevent Shutdown, Stand By, Turn Off, Restart</title>"
$urlDownload = 'https://www.softwareok.com/Download/'

function global:au_GetLatest {
     (Invoke-WebRequest -Uri $releases) -match $regex | out-null     
     return @{
        Version = $matches.Version ;
        URL32 = 'https://www.softwareok.com/Download/DontSleep.zip'
        URL64 = 'https://www.softwareok.com/Download/DontSleep_x64.zip'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update
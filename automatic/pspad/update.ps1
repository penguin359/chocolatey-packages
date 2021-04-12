$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = 'http://www.pspad.com/en/download.php'
    #$regex    = 'pspad(\d+)_setup.exe'
    # 5.0.6 (589)
    $regex    = '(?<VersionMajor>[\d\.]+) \((?<VersionMinor>\d+)\)'

    $download_page = Invoke-WebRequest -Uri $releases
 
	#$regex_version = 'PSPad - current version (?<Version>[\d\.]+) \('
	$download_page -match $regex | Out-Null
    $version    = $matches.VersionMajor + '.' + $matches.VersionMinor
    $versionURL = $matches.versionMajor -Replace '\.',''

    return @{
        Version = $version
        URL32   = 'https://www.pspad.com/files/pspad/pspad' + $versionURL + '_setup.exe'
        URL64   = 'https://www.pspad.com/files/pspad/pspad' + $versionURL + '_x64_setup.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update
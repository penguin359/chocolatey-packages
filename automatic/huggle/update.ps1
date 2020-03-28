import-module au

function global:au_GetLatest {	
    $github_repository = 'huggle/huggle3-qt-lx'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex32  = 'huggle_([\d\.]+).exe'
    $regex64  = 'huggle_(?<Version>[\d\.]+)_x64.exe'

    $url32 = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex32
    $url64 = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex64

    return @{
        Version = $matches.Version
        URL32   = 'https://github.com' + $url32.href
        URL64   = 'https://github.com' + $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"        = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`${1}'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }        
    }
}

update
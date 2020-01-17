import-module au

function global:au_GetLatest {
    $releases = 'https://www.log4om.com/download/'
    $regex    = 'Log4OM\d+_(?<Version>[\d_]+)_Portable.zip'

    $url     = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links |? href -match $regex | select -First 1
    $version = $matches.Version -Replace "_", "."
	
	return @{
        Version = $version
        URL32   = $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
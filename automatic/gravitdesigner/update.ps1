import-module au

function global:au_GetLatest {
    $releases = 'https://www.designer.io/changelog'
    $regex   = '<h3>Version (?<Version>[\d\.\-]+)</h3>'
    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
    $version = $matches.Version -replace '-', '.'
    	 
	 return @{ Version = $version }
}

function global:au_SearchReplace {
    @{
         "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl
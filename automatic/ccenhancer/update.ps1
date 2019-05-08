import-module au

function global:au_GetLatest {
    $releases = 'https://singularlabs.com/software/ccenhancer/download-ccenhancer'
    $regex   = '<td>(?<Version>[\d\.]+)</td>'

     (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null
	 
     return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""            
        }
    }
}

update
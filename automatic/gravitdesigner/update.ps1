import-module au

function global:au_GetLatest {
    $releases = 'https://www.designer.io/changelog'
    $regex   = '<h3>Version (?<Version>[\d\.\-]+)</h3>'
    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null    
    	 
	return @{ Version = $matches.Version -replace '-', '.' }
}

function global:au_SearchReplace {
    @{
         "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}
    
try {
    update -ChecksumFor none -NoCheckUrl
} catch {
    $ignore = 'The request was aborted: Could not create SSL/TLS secure channel.'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}

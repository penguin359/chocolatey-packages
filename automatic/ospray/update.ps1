import-module au

function global:au_GetLatest {	
  $github_repository = 'ospray/ospray'
  $releases = 'https://github.com/' + $github_repository + '/releases/latest'
  $regex   = 'ospray-(?<Version>[\d\.]+).msi$'

  (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null

	return @{
		Version = $matches.Version
	}
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl
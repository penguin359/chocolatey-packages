Import-Module au

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32    
}

function global:au_GetLatest {
    $github_repository = "reds-heig/logisim-evolution"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex    = 'logisim-evolution-(?<Version>[\d\.]+)-all.jar'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex

    return @{
        Version = $matches.Version
        URL32   = 'https://github.com' + $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }        
    }
}

update -ChecksumFor none
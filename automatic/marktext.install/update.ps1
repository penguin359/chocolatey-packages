import-module au

function global:au_GetLatest {
    $github_repository = "marktext/marktext"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex   = '/v(?<Version>[\d\.]*)/.*.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex

    return @{
        Version = $matches.Version        
        URL32   = 'https://github.com' + $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }        
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update
}
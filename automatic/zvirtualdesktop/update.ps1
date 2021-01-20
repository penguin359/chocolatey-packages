import-module au

$github_repository = 'mzomparelli/zVirtualDesktop'

function global:au_BeforeUpdate {
    Remove-Item "$PSScriptRoot\tools\*.exe"

    Invoke-WebRequest $Latest.URL32 -OutFile "${env:tmp}\zVirtualDesktop.exe"

    $Latest.ChecksumType = "sha256"
    $Latest.Checksum32   = Get-FileHash -Algorithm $Latest.ChecksumType -Path "${env:tmp}\zVirtualDesktop.exe" | ForEach-Object Hash
}

function global:au_GetLatest {
    $releases      = "https://github.com/" + $github_repository + "/releases/latest"
    $regex_version = "/archive/(?<Version>[\d\.]+).zip$"
    $regex_url     = "^(https://zomp.co/Files.aspx\?id=.*)$"
    
	(Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex_version | Out-Null
    $version = $matches.Version
    $url     = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex_url
    
	return @{ Version = $version ; URL32 = $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }        
    }
}

update -NoCheckUrl -ChecksumFor none
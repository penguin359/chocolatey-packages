import-module au


function global:au_BeforeUpdate {
    Remove-Item "$PSScriptRoot\tools\*.exe"

    Invoke-WebRequest $Latest.URL32 -OutFile "${env:tmp}\zVirtualDesktop.exe"

    $Latest.ChecksumType = "sha256"
    $Latest.Checksum32   = Get-FileHash -Algorithm $Latest.ChecksumType -Path "${env:tmp}\zVirtualDesktop.exe" | ForEach-Object Hash
}

function global:au_GetLatest {
    $github_repository = 'mzomparelli/zVirtualDesktop'
    $releases      = "https://github.com/" + $github_repository + "/releases/latest"    
    #$regex = "zVirtualDesktop.exe"
    $regex = "https://zomp.co/Files.aspx\?id="
    $regex_version = '/tag/(?<Version>[\d\.]+)'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = ($download_page).links | ? href -match $regex
    $download_page -match $regex_version
    $version = $matches.Version
        
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
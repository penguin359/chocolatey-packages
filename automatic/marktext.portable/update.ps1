import-module au
$github_repository = "marktext/marktext"
$releases = "https://github.com/" + $github_repository + "/releases/latest"

function global:au_BeforeUpdate {
    Remove-Item "$PSScriptRoot\tools\*.exe"

    $filePath = "$PSScriptRoot\tools\$($Latest.FileName)"
    Invoke-WebRequest $Latest.URL32 -OutFile $filePath

    $Latest.ChecksumType = "sha256"
    $Latest.Checksum = Get-FileHash -Algorithm $Latest.ChecksumType -Path $filePath | ForEach-Object Hash
}

function global:au_GetLatest {	
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = $github_repository + '/releases/download/.*/marktext-(?<Version>[\d\.]*)[\w-]*.exe$'
	 $url = $download_page.links | ? href -match $regex
     return @{ Version = $matches.Version ; URL32 = "https://github.com" + $url.href }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32).*"      = "`${1}$($Latest.URL32)"
            "(?i)(x64).*"      = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{			
            "marktext-[\d\.]+.exe" = "marktext-'$($Latest.Checksum32)'.exe"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none -NoCheckUrl
}
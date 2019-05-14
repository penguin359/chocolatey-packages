import-module au
$github_repository = "gitextensions/gitextensions"
$releases = "https://github.com/" + $github_repository + "/releases/latest"

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {	
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
     # Note: Version of the downloaded file is like "w.x.y.z" but we keep only "w.x.y"
	 $regex   = $github_repository + '/releases/download/.*/GitExtensions-Portable-(?<Version>[\d\.]+)\.\d+[\w-]*.zip'
	 $url = $download_page.links | ? href -match $regex     
     return @{ Version = $matches.Version ; URL32 = "https://github.com" + $url.href }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL32)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
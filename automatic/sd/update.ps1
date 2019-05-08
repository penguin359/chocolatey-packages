import-module au

$releases = 'http://www.ei5di.com'

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = '<a href="http://www.ei5di.com/sdhist.html"><b>V(?<Version>[0-9\.]+).*</b></a>'
	 $download_page -match $regex	 
     return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
     @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32).*"      = "`${1}$($Latest.URL32)"
            "(?i)(x64).*"      = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }        
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
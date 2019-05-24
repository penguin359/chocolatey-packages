import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'http://www.ei5di.com'
    $regex   = '<a href="http://www.ei5di.com/sdhist.html"><b>V(?<Version>[0-9\.]+).*</b></a>'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$download_page -match $regex | Out-Null
    return @{ Version = $matches.Version ; URL32 = 'http://www.ei5di.com/sd/sdsetup.exe' }
}

function global:au_SearchReplace {
     @{
        "legal\VERIFICATION.txt"  = @{
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
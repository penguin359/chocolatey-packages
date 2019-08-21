import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://raw.githubusercontent.com/ScriptTiger/Unified-Hosts-AutoUpdate/master/VERSION'
    $regex    = '^(?<Version>[\d\.]+)\ .*'

    (Invoke-WebRequest -Uri $releases).Content -Match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://github.com/ScriptTiger/Unified-Hosts-AutoUpdate/archive/master.zip'
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }        
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
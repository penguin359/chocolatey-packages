import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = "jlord/git-it-electron"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex    = '/jlord/git-it-electron/tree/(?<Version>[\d\.]*)\"'

    (Invoke-WebRequest -Uri $releases).Content -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $version
        URL32   = 'https://github.com/jlord/git-it-electron/releases/download/' + $version + '/Git-it-Win-ia32.zip'
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
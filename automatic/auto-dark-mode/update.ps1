import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = "Armin2208/Windows-Auto-Night-Mode"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"    
    $regex = 'Armin2208/Windows-Auto-Night-Mode/tree/(?<Version>[\d\.]+)'

    $download_page = (Invoke-WebRequest -Uri $releases).RawContent -match $regex
    $version = $matches.Version

    return @{
        Version = $version
        URL32 = 'https://github.com/' + $github_repository + '/releases/download/' + $version + '/AutoDarkMode_Setup.exe'
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
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://ci.appveyor.com/api/projects/LibreHardwareMonitor/LibreHardwareMonitor/history?recordsNumber=1'
    $regex    = '"version":"(?<Version>[\d\.]+)"'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null
    
    return @{
        Version = $matches.Version
        URL32 = 'https://ci.appveyor.com/api/buildjobs/s56wn5cxknhip56f/artifacts/bin/Release.zip'
    }
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
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
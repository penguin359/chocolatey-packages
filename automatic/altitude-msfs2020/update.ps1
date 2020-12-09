import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {    
    $releases = "https://www.ivao.aero/softdev/beta/altitudebeta.asp"    
    $regex = 'target="dl">v(?<Version>[\d\.b]+) Voice'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regex | Out-Null
    $version = $matches.Version -Replace '-', '.'

    return @{
        Version = $version
        URL32 = 'https://api.ivao.aero/v2/softwares/altitude/52/files/latest/download'
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

        "tools\chocolateyinstall.ps1" = @{
          "amidst-v[\d\-]+.exe" = "$($Latest.FileName32)"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
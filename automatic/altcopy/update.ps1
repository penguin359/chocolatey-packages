import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://altcopy.net'
    $regex    = '<p id="versionPc">Version: (?<Version>[\d\.]+)</p>'

    $ie = New-Object -com internetexplorer.application
    $ie.Visible = $false
    $ie.Navigate($releases)
    while ($ie.Busy -eq $true){Start-Sleep -seconds 4;}
    $ie.Document.body.outerHTML -match '<p id="versionPc">Version: (?<Version>[\d\.]+)</p>' | Out-Null

    return @{ Version = $matches.Version ; URL32 = $url }
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
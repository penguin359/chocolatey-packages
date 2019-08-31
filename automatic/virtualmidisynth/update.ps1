import-module au

function global:au_BeforeUpdate {
    $filename       = 'CoolSoft_VirtualMIDISynth_' + $Latest.Version + '.exe'
    $unixEpochStart = new-object DateTime 1970,1,1,0,0,0,([DateTimeKind]::Utc)
    $timestamp      = [int]([DateTime]::UtcNow - $unixEpochStart).TotalSeconds
    $url            = 'https://coolsoft.altervista.org/download/CoolSoft_VirtualMIDISynth_' + $Latest.Version + '.exe'
    $urlDownload    = $url + '?tckt=' + $timestamp

    Remove-Item -Path "tools\*.exe"
    Invoke-WebRequest -Uri $urlDownload -outFile "tools\$filename"

    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32     = checksum -t sha256 "tools\$filename"
    $Latest.URL32          = $url
}

function global:au_GetLatest {
    $releases = 'https://coolsoft.altervista.org/en/virtualmidisynth'
    $regex    = 'CoolSoft_VirtualMIDISynth_(?<Version>[\d\.]+).exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$download_page.links | ? href -match $regex | Select -First 1 | Out-Null

    return @{
        Version  = $matches.Version
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

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
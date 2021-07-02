import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://github.com/ea4k/klog/releases/latest'
    $regex    = 'KLog-(.*)-windows-installer.exe$'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url     = $download_page.links | ? href -match $regex | select -Last 1
    $version = $url.href -split '-|.exe' | select -Last 1 -Skip 3

     # When the fourth segment is already used, it is recommended to add two zeroes (00) to the end of the version. Then when you need to fix, you just increment that number.
     $versionNbSegment = ($version.ToCharArray() | Where-Object {$_ -eq '.'} | Measure-Object).Count
     # if ($versionNbSegment -eq 3) { $version += "00" }
     return @{ Version = $version ; URL32 = 'https://github.com' + $url.href }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(Get-RemoteChecksum ).*" = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*"   = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"         = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"         = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}

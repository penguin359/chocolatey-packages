import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://download.wireguard.com/windows-client/'
    $regex32  = 'wireguard-x86-([\d\.]+).msi'
    $regex64  = 'wireguard-amd64-(?<Version>[\d\.]+).msi'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

	$url32    = ($download_page.links | ? href -match $regex32).href | Select -Last 1
    $url64    = ($download_page.links | ? href -match $regex64).href | Select -Last 1
    $version  = $matches.Version
    #$isBeta   = $version -match "^0\..*"

    #if ($isBeta) { $versionSuffix = '-pre' } else { $versionSuffix = '' }

	return @{
        #Version = $version + $versionSuffix
        Version = $version
        URL32   = $releases + $url32
        URL64   = $releases + $url64
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none
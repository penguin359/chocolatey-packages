import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://slproweb.com/products/Win32OpenSSL.html'
    $regex32  = 'Win32OpenSSL-([\d_]+)([a-z]+).exe'
    $regex64  = 'Win64OpenSSL-(?<Version>[\d_]+)(?<VersionLetter>[a-z]+).exe'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	
	$url32   = $download_page.links | ? href -match $regex32 | Select -First 1
    $url64   = $download_page.links | ? href -match $regex64 | Select -First 1
    $version = $matches.Version -Replace '_','.'

    if ($matches.VersionLetter) {
        $version = $version + '.' + ( [int][char]$matches.VersionLetter - 96 ) + '00'
    }

    return @{
        Version = $version
        URL32 = 'https://slproweb.com' + $url32.href
        URL64 = 'https://slproweb.com' + $url64.href
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
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
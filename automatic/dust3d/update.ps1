import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'huxingyi/dust3d'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex32  = 'dust3d-[\d\.]+(-beta|-rc)?\.[\d\.]*-x86.zip'
    $regex64  = 'dust3d-(?<Version>[\d\.]+)(-beta|-rc)?(?<VersionBeta>\.[\d\.]*).zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	
	$url32 = $download_page.links | ? href -match $regex32
    $url64 = $download_page.links | ? href -match $regex64

    if ($matches.VersionBeta) {
        $version = $matches.Version + $matches.VersionBeta + $matches.1
    } else {
        $version = $matches.Version
    }

    return @{
        Version = $version
        URL32   = 'https://github.com' + $url32.href
        URL64   = 'https://github.com' + $url64.href
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
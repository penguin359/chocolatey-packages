import-module au

function global:au_GetLatest {
    $releases = 'https://developer.nvidia.com/cuda-downloads'
    $regex    = '(/(?<MajorVersion>[\d\.]+)/Prod/local_installers/(?<File>cuda_(?<Version>[\d\.]+)_[\d\.]+_win10.exe))'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match '/(?<MajorVersion>[\d\.]+)(/Prod)?/local_installers/(?<File>cuda_(?<Version>[\d\.]+)_[\d\.]+_win10.exe)' | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://developer.download.nvidia.com/compute/cuda' + $matches.0
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update
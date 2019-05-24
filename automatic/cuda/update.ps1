import-module au

function global:au_GetLatest {
    $releases = 'https://developer.nvidia.com/cuda-downloads'
    $regex    = '(?<File>cuda_(?<Version>[\d\.]+)_[\d\.]+_win10.exe)'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/' + $matches.File
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
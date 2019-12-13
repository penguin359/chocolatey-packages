import-module au

function global:au_GetLatest {
    $github_repository = "chrismaltby/gb-studio"
    $releases          = "https://github.com/" + $github_repository + "/releases/latest"

    #$regex32  = 'GB.Studio-win32-ia32-squirrel-([\d\.]+).zip$'
    $regex32  = 'GB.Studio-.*32.*-squirrel-([\d\.]+).zip$'
    $regex64  = 'GB.Studio-.*64.*-squirrel-(?<Version>[\d\.]+).zip$'

    $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $url32         = $download_page | ? href -match $regex32
    $url64         = $download_page | ? href -match $regex64

    return @{
        Version = $matches.Version
        URL32   = 'https://github.com/' + $url32.href
        URL64   = 'https://github.com/' + $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"            
            "(GB Studio-)[\d\.]+( Setup.exe)"   = "`${1}$($Latest.Version)`${2}"
        }
    }
}

update
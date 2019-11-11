$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {    
    $releases     = 'https://www.hamrick.com/alternate-versions.html'    
    $regex32      = '<a href="(?<File32>files/vuex32\d+.exe)" onclick="pageTracker._trackPageview\(''files/vuex32\d+.exe''\);">[\d\.]+</a>'
    $regex64      = '<a href="(?<File64>files/vuex64\d+.exe)" onclick="pageTracker._trackPageview\(''files/vuex64\d+.exe''\);">(?<Version>[\d\.]+)</a>'

    $download_page = (Invoke-WebRequest -Uri $releases).RawContent
    $download_page -match $regex32 | Out-Null
    $file32  = $matches.File32
    $download_page -match $regex64 | Out-Null
    $file64  = $matches.File64

    return @{
        Version = $matches.Version
        URL32   = 'https://www.hamrick.com/' +$file32
        URL64   = 'https://www.hamrick.com/' +$file64
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"        = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`${1}'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }
    }
}

update

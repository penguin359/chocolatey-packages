import-module au

function global:au_GetLatest {
    $releases        = 'https://build.openvpn.net/downloads/releases'
    #$releasesVersion = 'https://community.openvpn.net/openvpn/wiki/GettingTapWindows'
    $releasesVersion = 'https://raw.githubusercontent.com/OpenVPN/tap-windows6/master/version.m4'
    $regexProductVersion     = 'define\(\[PRODUCT_VERSION\], \[(?<ProductVersion>[\d\.]+)\]\)'
    $regexProductTapWinBuild = 'define\(\[PRODUCT_TAP_WIN_BUILD\], \[(?<ProductTapWinBuild>[\d\.]+)\]\)'    
    
    $download_page = (Invoke-WebRequest -Uri $releasesVersion -UseBasicParsing).RawContent
    $download_page -match $regexProductVersion | Out-Null
    $productVersion = $matches.ProductVersion
    $download_page -match $regexProductTapWinBuild | Out-Null
    $productTapWinBuild = $matches.ProductTapWinBuild

    return @{
        Version      = $productVersion
        URL32 = $releases + "/tap-windows-$productVersion-I$productTapWinBuild-Win10.exe"
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*\`$url_win10\s*=\s*)('.*')"       = "`$1'$($Latest.URL32)'"
            "(^(\s)*\`$checksum_win10\s*=\s*)('.*')"  = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update

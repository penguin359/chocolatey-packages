import-module au

function global:au_GetLatest {
    $releases        = 'https://build.openvpn.net/downloads/releases'
    #$releasesVersion = 'https://community.openvpn.net/openvpn/wiki/GettingTapWindows'
    $releasesVersion = 'https://raw.githubusercontent.com/OpenVPN/tap-windows6/master/version.m4'
    #$regexVersion    = '>tap-windows-(?<Version>[\d\.]*)  </td><td style="text-align: left">tap-windows6'    
    $regexProductVersion     = 'define\(\[PRODUCT_VERSION\], \[(?<ProductVersion>[\d\.]+)\]\)'
    $regexProductTapWinBuild = 'define\(\[PRODUCT_TAP_WIN_BUILD\], \[(?<ProductTapWinBuild>[\d\.]+)\]\)'    
    
    #$regex           = "tap-windows-$version-(.*)-Win10.exe$"
    #$regex_win7      = "tap-windows-$version-(.*)-Win7.exe$"
    #(Invoke-WebRequest -Uri $releasesVersion -UseBasicParsing).RawContent -match $regexVersion | Out-Null
    $download_page = (Invoke-WebRequest -Uri $releasesVersion -UseBasicParsing).RawContent
    $download_page -match $regexProductVersion | Out-Null
    $productVersion = $matches.ProductVersion
    $download_page -match $regexProductTapWinBuild | Out-Null
    $productTapWinBuild = $matches.ProductTapWinBuild
    #$version = $matches.Version
    
    #$url      = (Invoke-WebRequest -Uri $releases).links | ? href -match $regex
    #$url_win7 = (Invoke-WebRequest -Uri $releases).links | ? href -match $regex_win7
     
    return @{
        Version      = $productVersion
        #URL32        = $url.href
        URL32 = $releases + "/tap-windows-$productVersion-I$productTapWinBuild-Win10.exe"
        Version_win7 = $version
        #URL32_win7   = $url_win7.href
        URL32_win7 = $releases + "/tap-windows-$productVersion-I$productTapWinBuild-Win7.exe"
    }
}

function global:au_SearchReplace {
    $Checksum32_win7 = Get-RemoteChecksum "$($Latest.URL32_win7)"
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*\`$url_others\s*=\s*)('.*')"      = "`$1'$($Latest.URL32_win7)'"
            "(^(\s)*\`$checksum_others\s*=\s*)('.*')" = "`$1'$($Checksum32_win7)'"
            "(^(\s)*\`$url_win10\s*=\s*)('.*')"       = "`$1'$($Latest.URL32)'"
            "(^(\s)*\`$checksum_win10\s*=\s*)('.*')"  = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
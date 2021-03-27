import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releasesVersion = 'https://ci.appveyor.com/api/projects/LibreHardwareMonitor/LibreHardwareMonitor/history?recordsNumber=1'
    $regexVersion    = '"version":"(?<Version>[\d\.]+)"'
    $releasesUrl     = 'https://ci.appveyor.com/project/LibreHardwareMonitor/librehardwaremonitor/build/artifacts'                        
    $regexUrl        = '/artifacts/bin%2FRelease.zip$'

    <#$ie = New-Object -com internetexplorer.application
    $ie.Visible = $false
    $ie.Navigate($releasesUrl)
    while ($ie.Busy -eq $true){Start-Sleep -seconds 4;}
    $url = ($ie.Document.body.GetElementsByClassName("artifact-type zip") | Select-Object "href").href -Replace "%2F", "/" #>

    (Invoke-WebRequest -Uri $releasesVersion).RawContent -match $regexVersion | Out-Null

    return @{
        Version = $matches.Version
        URL32   = Get-RedirectedUrl https://ci.appveyor.com/api/buildjobs/i3wv5kppb7mk5xph/artifacts/bin%2FRelease.zip
     }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }
    }
}

update -ChecksumFor none
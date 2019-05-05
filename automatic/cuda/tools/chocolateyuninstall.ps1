$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName

foreach ($software in @('NVIDIA CUDA Documentation *', 'NVIDIA CUDA Development *', 'NVIDIA CUDA Samples *', 'NVIDIA CUDA Visual Studio Integration *')) {
  $uninstalled = $false
  [array]$key = Get-UninstallRegistryKey -SoftwareName $software

  if ($key.Count -eq 1) {
      $key | % {        
        $file = ("$($_.UninstallString)" -Split '" "'| select -First 1) + '"'
        $silentArgs = '"' + ("$($_.UninstallString)" -Split '" "'| Select -Last 1) + " -silent"
        Uninstall-ChocolateyPackage -PackageName "$packagename" -File "$file" -SilentArgs "$silentArgs"
    }
  } elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
  } elseif ($key.Count -gt 1) {
    Write-Warning "$($key.Count) matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer the following keys were matched:"
    $key | % {Write-Warning "- $($_.DisplayName)"}
  }
  Sleep 5
}  

# Uninstall MSI packages
foreach ($software in @( 'NVIDIA Nsight Compute *', 'NVIDIA Nsight Systems *', 'NVIDIA Nsight Visual Studio Edition *', 'NVIDIA Tools Extension SDK (NVTX) - 64 bit')) {
  $packageArgs = @{
    packageName   = $env:ChocolateyPackageName    
    fileType      = 'MSI'
    silentArgs    = "/qn /norestart"
    validExitCodes= @(0, 3010, 1605, 1614, 1641)
  }

  $uninstalled = $false
  [array]$key = Get-UninstallRegistryKey -SoftwareName $software

  if ($key.Count -eq 1) {
    $key | % { 
      $packageArgs['file'] = "$($_.UninstallString)"
      if ($packageArgs['fileType'] -eq 'MSI') {      
        $packageArgs['silentArgs'] = "$($_.PSChildName) $($packageArgs['silentArgs'])"      
      }

      Uninstall-ChocolateyPackage @packageArgs
    }
  } elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
  } elseif ($key.Count -gt 1) {
    Write-Warning "$($key.Count) matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer the following keys were matched:"
    $key | % {Write-Warning "- $($_.DisplayName)"}
  }
}
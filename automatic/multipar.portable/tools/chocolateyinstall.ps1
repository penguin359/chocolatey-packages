$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://public.sn.files.1drv.com/y4mXVnO96Fu4BHCxoBh72Uv2tGRf8_p6XRb2Oz9ftGfZYL3lv7mq-AkU_d_kZ6OcgSakuKqlznc3QhXOU_h94GlvG79vPPycl7nNYQSbh5wl313tlA75jI1_SNhqSuh-CFMZAcm-POsFCRKd_2uuFOnYZV95aYs2GUIoqVf_r2dYcVA1NJ49b9CFuUixN5StrLpksr65RHjhQ-Sexijq_YSOx5uEkTjxCw4-5bBFK6B8Ek?access_token=EwAYA61DBAAUzl/nWKUlBg14ZGcybuC4/OHFdfEAAciFGLC3CRA0Ms7etJ%2bShe6wuKT3XfKn4MYIhN3AhXvp0pEJUJ78rF0%2b7cLhz8BbItIf//A27bpyNX1kz9H4F5k1LuqrFeugU%2b29ZvfvMTAnjKQW53o6NGd3Y0Chcrmx5RUxp4Szou6XxYd24jpq7dnbaR6lRoMppgJ9%2bQz28/hEHumP0twd/GhpLM6pEUrMNrRHX2F4M1KOv9dJytROFa8BHCKNSqfCrSqF2sBFI49%2bzRaCcpJIGrnaUZxgOtah6KK3qaYd8Cpb8w0OZtE6VYUrsXQU%2bvuFQPsA/kUNgL%2bt8tkES%2bKwZbANHvtiFANvOACpSR8thyKQ14uVQnK4TaYDZgAACA6Cj8pJNSwW6AFrEJDVLsdQsY4k53jeETNOK63ruXjL1n4g4N7Jr98ZWTX9PEFr4c5J6MR7E9mD9R3B%2bjMS1GwhfG4z0bbn9mzOVVZ5YP8Qg88sgUI/oNPm3NreVGnfANJhF/AVg0BNzW8B%2bIjistFI7pI0IdPN0Y8J5ZSlo6DYdQ%2bfhLQivzWnuTM8MlD9pMSEG1qVgOzgyQBbNgdfOCdH1Jlxw9E9JTD0a1XQbfZhLK75pGc/rQJfwPpaWicTyQvWBWR3HD65OvPHgwCpmaBd%2bKlBJNXuQFZ2ozpYASusGBPpCrXgzePlA87VCqiY3qkRhs6mpCNHYfy0eNI6gPHPSnVrVhka2DJS1NyIyf5dJvN24DEKkXJ9wa47R8kKBOFjtxvctwURaqSIABsfaQT%2b/mkmOXyk0/EDSIpyUtGQMzHPvzNok7WQe6jGEo8Ki9XYR2EE3XYUxqvD0qYtj0R3Mrl0FRXTSJBfrpmRvHmHJSfVj6XGC2gJuTe1QwCY%2b9QS6yzpGpr/H2oJsYCKa5YEdoAKJQO6oWPcmmPEDp1vBh06u2ZbZskUqBKxk4mHAwYPud8hihgN5QTp065kQe4/Vn6XADwICs1FpBqRZRArQH5nT8B8sLJVswbxcYuY81zRzB2%2bItQI5pPuwgkT7kEdlhcC'

  checksum      = 'd1b45965486684d2ef5b7c9ae396b6a6c1463750eb00b8af1dfa021883c9c166'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "MultiPar.lnk"
$targetPath = Join-Path $toolsDir "MultiPar.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

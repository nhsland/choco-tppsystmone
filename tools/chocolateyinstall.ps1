
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://portalvhdsd5jq2659yw9p5.blob.core.windows.net/installers/SystmOne.exe'
$url64      = ''

$pp = Get-PackageParameters

if ($pp["Edition"] -eq $null -or $pp["Edition"] -eq '') { $pp["Edition"] = 'LicenseKey' }

$silentArgs = "/S /Port:$($pp["Port"]) /Edition:$($pp["Edition"]) /InstallationPath:$($pp["InstallationPath"])"
if ($pp["AdditionalTools"] -eq 'true') { $silentArgs += " /Additionaltools" }

Write-Debug "This would be the Chocolatey Silent Arguments: $silentArgs"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'tppsystmone*'

  checksum      = 'd6bba6c0247e8d393b2dcd7f2fe7f5a319288751f2cb5a9f2afb338ff8d457e1'
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'

  silentArgs   =  "/exenoui /q PIDKEY=$($pp["Edition"])"
}

Install-ChocolateyPackage @packageArgs




















$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'https://files3.codecguide.com/K-Lite_Codec_Pack_1768_Mega.exe'

$silentArgs = '/VERYSILENT'

$checksum = 'c8fac6eaafdc73d2ae203b8e4ef9f9d0'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"


































































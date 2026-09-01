$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'https://files3.codecguide.com/K-Lite_Codec_Pack_1995_Mega.exe'

$silentArgs = '/VERYSILENT'

$checksum = '7aaeb6ec4662adc52dec6201381f397a'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"


































































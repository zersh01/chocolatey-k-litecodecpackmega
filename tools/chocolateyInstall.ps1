$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'https://files3.codecguide.com/K-Lite_Codec_Pack_1880_Mega.exe'

$silentArgs = '/VERYSILENT'

$checksum = 'f77e19a536e97486320b7f0f8e49f952'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"


































































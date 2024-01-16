$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'https://files3.codecguide.com/K-Lite_Codec_Pack_1805_Mega.exe'

$silentArgs = '/VERYSILENT'

$checksum = '7848fe1582972818d9665d34b17426a4'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"


































































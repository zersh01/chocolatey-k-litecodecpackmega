$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'https://files3.codecguide.com/K-Lite_Codec_Pack_1730_Mega.exe'

$silentArgs = '/VERYSILENT'

$checksum = 'df6161895e3f0749c4ab39346f84f8fc'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"


































































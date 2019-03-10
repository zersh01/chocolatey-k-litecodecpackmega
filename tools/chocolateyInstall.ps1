$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'http://files2.codecguide.com/K-Lite_Codec_Pack_1475_Mega.exe'
$silentArgs = '/VERYSILENT'

$checksum = '1d6741af3ede613474b6148b3148982a'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"



































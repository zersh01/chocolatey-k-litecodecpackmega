$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'http://files2.codecguide.com/K-Lite_Codec_Pack_1350_Mega.exe'
$silentArgs = '/VERYSILENT'

$checksum = '6e9799e437af7e61fbf94db3d4d73227'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"






















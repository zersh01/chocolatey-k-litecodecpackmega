$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'http://files3.codecguide.com/K-Lite_Codec_Pack_1295_Mega.exe'
$silentArgs = '/VERYSILENT'

$checksum = 'e119174a76a96da06ddb31364b5dea60'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"


















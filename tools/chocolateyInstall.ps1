$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'http://files2.codecguide.com/K-Lite_Codec_Pack_1460_Mega.exe'
$silentArgs = '/VERYSILENT'

$checksum = '159a6554c8db64373940bcb46746fefa'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"

































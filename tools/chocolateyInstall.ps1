$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'http://files2.codecguide.com/K-Lite_Codec_Pack_1415_Mega.exe'
$silentArgs = '/VERYSILENT'

$checksum = 'dd64bd7be05fd5684498038c141f57a6'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"


























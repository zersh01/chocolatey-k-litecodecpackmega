$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'http://download.betanews.com/download/1080441198-1/K-Lite_Codec_Pack_1170_Mega.exe'
$silentArgs = '/VERYSILENT'

$checksum = 'B6CBCF18334CD2D6C00BBFB9D57882F9'
$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"


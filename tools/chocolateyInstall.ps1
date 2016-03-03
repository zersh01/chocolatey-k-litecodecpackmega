$packageName = 'k-litecodecpackmega'
$installerType = 'exe'
$url = 'http://download.betanews.com/download/1080441198-1/K-Lite_Codec_Pack_1201_Mega.exe'
$silentArgs = '/VERYSILENT'

$checksum = '6ccd401207f38ed30d753d924f785f6a'
$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"





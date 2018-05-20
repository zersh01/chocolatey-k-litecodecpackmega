#!C:\Perl64\bin\perl.exe
##!/usr/bin/perl
#
#zersh@mail.ru
#08/2017

use strict;
use warnings;
use Data::Dumper;
use LWP::UserAgent;

my $url = "http://www.codecguide.com/download_k-lite_codec_pack_mega.htm";
my $last = "D:\\YandexDisk\\backup\\Chocolatey\\MyProject\\k-litecodecpackmega\\last";
my $SoftName = "K-Lite Codec Pack Mega";

my $ua = LWP::UserAgent->new(
    agent   =>  "Chrome/Test",
    timeout =>  30,
);

my $resource = $ua->get($url);
my $content = $resource->content;


#Пока так проще
#Version (.\d.\d.\d) .*Changelog:\<\/b\>\<\/p><ul><li>(U.*)Download
#.*Version (.\d.\d.\d) .*Changelog:\<\/b\>\<\/p><ul><li>(U.*)Download.*(K-.+\.exe).*\n.*MD5.+: (.*)<br

#убираем все переводы строк
$content =~ s@\r?\n*@@g;
#грепаем нужные данные
$content =~ s@.*Version (.\d.\d.\d) .*Changelog:\<\/b\>.+?<ul>.+?<li>(U.*)Download.*(K-.+\.exe).*MD5\<\/b\>: (.{32})@@;

my $version = $1; 
my $ChangeLog = $2; 
my $FileName = $3;
my $md5 = $4;

$ChangeLog =~ s|<.+?>| |g;


#open (my $fh,">content");
#    print $fh "$content";
#close $fh;

#Продолжаем если версии не совпадают - иначе Выход.
my $lastvers = read_file("$last");
unless ($lastvers ne $version){
    printf "No need update!\n";
    exit 1;
}

print "Avalible new version\n Vers: $version\n File: $FileName\n MD5: $md5\n ChangeLog:$ChangeLog\n";
#exit;
#Пишем в файл ps1
my $cinst = 'tools\chocolateyInstall.ps1';
 
my $data = read_file($cinst);
$data =~ s/\$url = \'(.*)\'/\$url = \'http:\/\/files2.codecguide.com\/$FileName\'/g;
$data =~ s/\$checksum = \'(.*)\'/\$checksum = \'$md5\'/g;

write_file($cinst, $data);

#exit;
#Пишем в файл nuspec
my $uspec = 'k-litecodecpackmega.nuspec';
my $data2 = read_file($uspec);
$data2 =~ s|<version>(.*\d+)</version>|<version>$version</version>|g;
$data2 =~ s|<summary>$SoftName (.*\d+)</summary>|<summary>$SoftName $version</summary>|g;
$data2 =~ s|<releaseNotes>(.*)</releaseNotes>|<releaseNotes>$ChangeLog</releaseNotes>|g;
write_file($uspec, $data2);


#Пишем новую версию
open (my $fh,">$last");
    print $fh "$version";
close $fh;

#Создаём пакет и пушим его на сервер
`cd D:\\YandexDisk\\backup\\Chocolatey\\MyProject\\k-litecodecpackmega && choco pack`;
`choco push k-litecodecpackmega.$version.nupkg`;

exit;

sub read_file {
    my ($filename) = @_;
 
    open my $in, '<:encoding(UTF-8)', $filename or die "Could not open '$filename' for reading $!";
    local $/ = undef;
    my $all = <$in>;
    close $in;
 
    return $all;
}
 
sub write_file {
    my ($filename, $content) = @_;
 
    open my $out, '>:encoding(UTF-8)', $filename or die "Could not open '$filename' for writing $!";;
    print $out $content;
    close $out;
 
    return;
}

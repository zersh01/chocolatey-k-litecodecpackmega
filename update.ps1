import-module au

$releases = 'https://www.codecguide.com/download_k-lite_codec_pack_mega.htm'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)'.*'"   = "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*url\s*=\s*)'.*'"           = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)'.*'"      = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)'.*'"  = "`$1'$($Latest.ChecksumType32)'"
        }
        ".\k-litecodecpackmega.nuspec" = @{
            "(?i)(<version>).*(</version>)" = "`$1$($Latest.Version)`$2"
            "(?i)(<releaseNotes>).*(</releaseNotes>)" = "`$1$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    if ($download_page.Content -match 'Version\s+([0-9.]+)\s+Mega') {
        $version = $matches[1]
    } else {
        throw "Не удалось извлечь версию с страницы."
    }

    $majorGeeksLink = ($download_page.Links | Where-Object { $_.href -match 'majorgeeks\.com' } | Select-Object -First 1).href
    if ($majorGeeksLink) {
        $mgPage = Invoke-WebRequest -Uri $majorGeeksLink -UseBasicParsing
        $url = ($mgPage.Links | Where-Object { $_.href -match 'files3\.codecguide\.com/.*Mega\.exe' } | Select-Object -First 1).href
    } else {
        $url = ($download_page.Links | Where-Object { $_.href -match 'files3\.codecguide\.com/.*Mega\.exe' -and $_.href -notmatch 'old' } | Select-Object -First 1).href
    }
    if (-not $url) {
        throw "Не удалось найти URL скачивания на files3.codecguide.com."
    }
    if (-not $url.StartsWith('http')) {
        $url = "https://www.codecguide.com/$url"
    }

    if ($download_page.Content -match 'MD5:\s+([a-f0-9]{32})') {
        $checksum = $matches[1]
    } else {
        $checksum = 'NeedsDownload'
    }

    $sha256 = if ($download_page.Content -match 'SHA256:\s+([a-f0-9]{64})') { $matches[1] } else { 'Not found' }

    $changelogMatch = $download_page.Content -match 'Changelog:((?s).*?)(?=Download:|\Z)'
    $releaseNotes = if ($changelogMatch) { 
        $matches[1].Trim() -replace '^\s*\*\s*', '- ' -replace '\n\s*\n', "`n" 
    } else { 'No changelog found.' }

    return @{
        Version         = $version
        URL32           = $url
        Checksum32      = $checksum
        ChecksumType32  = 'md5'
        PackageName     = 'k-litecodecpackmega'
        ReleaseNotes    = $releaseNotes
    }
}

update -ChecksumFor 32

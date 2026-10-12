<#
.SYNOPSIS
    Script tai ISO Lubuntu 22.04 LTS (2.9GB)
.DESCRIPTION
    Su dung curl.exe voi che do resume de tai ISO on dinh.
#>
$ErrorActionPreference = 'Stop'
$dest = Join-Path $PSScriptRoot "lubuntu.iso"
$url = "https://cdimage.ubuntu.com/lubuntu/releases/22.04/release/lubuntu-22.04.5-desktop-amd64.iso"

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "       DANG TAI ISO LUBUNTU 22.04 LTS (2.9 GB)" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "URL: $url"
Write-Host "Luu tai: $dest"
Write-Host "Tien trinh dang tai xuong... (co the mat vai phut tuy toc do mang)`n" -ForegroundColor Yellow

# Dung curl.exe voi -C - (ho tro tiep tuc neu mat mang)
& curl.exe -L -C - --progress-bar -o $dest $url

if (Test-Path $dest) {
    $size = [math]::Round((Get-Item $dest).Length / 1GB, 2)
    Write-Host "`nTai thanh cong! Dung luong: $size GB" -ForegroundColor Green
    Write-Host "Ban co the mo Start-VM.bat de khoi dong may ao ngay bay gio." -ForegroundColor Cyan
} else {
    Write-Error "Tai khong thanh cong."
}

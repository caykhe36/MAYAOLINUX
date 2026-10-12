<#
.SYNOPSIS
    Script tu dong khoi tao may ao Tiny Core Linux tren VMware Workstation
.DESCRIPTION
    Kiem tra va tu dong tai ban ISO TinyCorePure64 (32MB) va tao dia ao VMDK 10GB (thin-provisioned).
#>
$ErrorActionPreference = 'Stop'

$scriptDir = $PSScriptRoot
$isoPath = Join-Path $scriptDir "TinyCorePure64.iso"
$vmdkPath = Join-Path $scriptDir "TinyCoreLinux.vmdk"
$vdiskManager = "C:\Program Files (x86)\VMware\VMware Workstation\vmware-vdiskmanager.exe"

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "  KHOI TAO MAY AO TINY CORE LINUX CHO VMWARE" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan

# 1. Kiem tra / Tai ISO
if (-not (Test-Path $isoPath)) {
    Write-Host "[1/2] Dang tai ISO Tiny Core Linux 64-bit (~32MB)..." -ForegroundColor Yellow
    $isoUrl = "http://www.tinycorelinux.net/15.x/x86_64/release/TinyCorePure64-current.iso"
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -Uri $isoUrl -OutFile $isoPath -UseBasicParsing
    Write-Host "  -> Da tai thanh cong: $isoPath" -ForegroundColor Green
} else {
    Write-Host "[1/2] File ISO da ton tai: $isoPath" -ForegroundColor Green
}

# 2. Kiem tra / Tao Virtual Disk (VMDK)
if (-not (Test-Path $vmdkPath)) {
    Write-Host "[2/2] Dang tao o dia ao VMDK 10GB..." -ForegroundColor Yellow
    if (Test-Path $vdiskManager) {
        & $vdiskManager -c -s 10GB -a lsilogic -t 0 $vmdkPath
        Write-Host "  -> Da tao thanh cong: $vmdkPath" -ForegroundColor Green
    } else {
        Write-Warning "Khong tim thay vmware-vdiskmanager.exe tai: $vdiskManager"
    }
} else {
    Write-Host "[2/2] O dia ao VMDK da ton tai: $vmdkPath" -ForegroundColor Green
}

Write-Host "`nHoan tat khoi tao! Ban co the chay Start-VM.bat de bat may ao." -ForegroundColor Cyan

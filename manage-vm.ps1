<#
.SYNOPSIS
    Script quan ly may ao Tiny Core Linux tren VMware Workstation
.DESCRIPTION
    Cung cap cac lenh khoi dong, tat, kiem tra trang thai cho may ao Tiny Core Linux.
.EXAMPLE
    .\manage-vm.ps1 -Action Start
    .\manage-vm.ps1 -Action Stop
    .\manage-vm.ps1 -Action Status
#>
param(
    [ValidateSet('Start', 'Stop', 'Reset', 'Status', 'Open')]
    [string]$Action = 'Start',
    [switch]$NoGui
)

$vmrun = "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe"
$vmware = "C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe"
$vmx = Join-Path $PSScriptRoot "TinyCoreLinux.vmx"

if (-not (Test-Path $vmx)) {
    Write-Error "Khong tim thay file cau hinh may ao: $vmx"
    exit 1
}

switch ($Action) {
    'Start' {
        Write-Host "Dang khoi dong Tiny Core Linux..." -ForegroundColor Cyan
        $mode = if ($NoGui) { "nogui" } else { "gui" }
        & $vmrun -T ws start $vmx $mode
        Write-Host "May ao da khoi dong thanh cong!" -ForegroundColor Green
    }
    'Stop' {
        Write-Host "Dang tat may ao Tiny Core Linux..." -ForegroundColor Yellow
        & $vmrun -T ws stop $vmx soft
        Write-Host "Da gui lenh tat may ao." -ForegroundColor Green
    }
    'Reset' {
        Write-Host "Dang khoi dong lai may ao..." -ForegroundColor Yellow
        & $vmrun -T ws reset $vmx soft
    }
    'Status' {
        Write-Host "Danh sach may ao dang chay:" -ForegroundColor Cyan
        & $vmrun -T ws list
    }
    'Open' {
        Write-Host "Dang mo VMware Workstation..." -ForegroundColor Cyan
        Start-Process $vmware -ArgumentList "-x `"$vmx`""
    }
}

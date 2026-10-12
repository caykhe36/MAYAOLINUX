@echo off
title Khoi dong Tiny Core Linux - VMware
echo ===================================================
echo     DANG KHOI DONG TINY CORE LINUX TRONG VMWARE
echo ===================================================
echo.
set "VMWARE_EXE=C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe"
set "VMX_PATH=%~dp0TinyCoreLinux.vmx"

if not exist "%VMWARE_EXE%" (
    echo [LOI] Khong tim thay VMware tai duong dan: %VMWARE_EXE%
    pause
    exit /b 1
)

if not exist "%VMX_PATH%" (
    echo [LOI] Khong tim thay file cau hinh may ao: %VMX_PATH%
    pause
    exit /b 1
)

echo Khoi chay may ao: %VMX_PATH%
start "" "%VMWARE_EXE%" -x "%VMX_PATH%"
echo.
echo May ao da duoc mo tren VMware Workstation!
timeout /t 5

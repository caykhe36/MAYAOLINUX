# Tiny Core Linux 64-bit trên VMware Workstation

Dự án cấu hình và tự động hóa máy ảo Linux siêu nhẹ **Tiny Core Linux 64-bit** (TinyCorePure64) chạy trên nền tảng **VMware Workstation**.

## 🚀 Đặc điểm nổi bật
- **Kích thước siêu nhỏ**: File ISO cài đặt chỉ **~32 MB**.
- **Tiêu thụ tài nguyên tối thiểu**: Khởi động chỉ chiếm khoảng **50MB - 70MB RAM**, cấp phát 1024MB RAM cho trải nghiệm mượt mà.
- **Tốc độ cực nhanh**: Chạy hoàn toàn trên RAM-disk, thời gian khởi động từ 1 - 3 giây.
- **Giao diện đồ họa (GUI)**: Đầy đủ môi trường Desktop với cửa sổ, chuột, thanh Dock biểu tượng (wbar) và trình quản lý ứng dụng (Apps).
- **Hỗ trợ 64-bit hiện đại**: Nhân Linux 64-bit mới nhất tương thích với kiến trúc x86_64 hiện nay.
- **Ổ đĩa ảo 10GB thin-provisioned**: Sẵn sàng để lưu trữ dữ liệu hoặc cài đặt vĩnh viễn (TC-Install).

---

## 📁 Cấu trúc thư mục

```text
C:\MAYAOLINUX\
├── TinyCoreLinux.vmx      # File cấu hình máy ảo VMware
├── TinyCoreLinux.vmxf     # File metadata XML của máy ảo
├── TinyCoreLinux.vmdk     # Ổ đĩa ảo VMware 10GB (thin-provisioned)
├── TinyCorePure64.iso     # File ISO cài đặt Tiny Core Linux 64-bit (~32MB)
├── Start-VM.bat           # Script 1-click khởi động ngay máy ảo
├── manage-vm.ps1          # Script PowerShell điều khiển máy ảo (Start/Stop/Reset/Status)
├── setup.ps1              # Script tự động tải ISO và tạo ổ đĩa nếu cài mới
├── Install-Guide.md       # Sổ tay hướng dẫn sử dụng và cài đặt phần mềm chi tiết
└── README.md              # Tài liệu giới thiệu dự án
```

---

## ⚡ Khởi động nhanh

1. Nhấp đúp chuột vào file [`Start-VM.bat`](file:///C:/MAYAOLINUX/Start-VM.bat) để mở và chạy máy ảo trên VMware Workstation.
2. Hoặc chạy lệnh PowerShell:
   ```powershell
   .\manage-vm.ps1 -Action Start
   ```
3. Xem hướng dẫn chi tiết cách dùng, cài phần mềm và lưu dữ liệu tại: [`Install-Guide.md`](file:///C:/MAYAOLINUX/Install-Guide.md).

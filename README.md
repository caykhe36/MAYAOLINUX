# Lubuntu 64-bit trên VMware Workstation (Hỗ trợ Full Màn Hình & PyCharm)

Dự án máy ảo **Lubuntu 64-bit** (môi trường đồ họa LXQt siêu nhẹ) được cấu hình tối ưu để chạy trên **VMware Workstation**, phục vụ học tập và lập trình Python với **PyCharm**.

## 🚀 Đặc điểm cấu hình
- **Hệ điều hành**: Lubuntu 22.04 LTS 64-bit.
- **Tiêu thụ RAM**: Chỉ ~450 MB RAM ở trạng thái chờ, cấp phát 4GB RAM cho máy ảo chạy mượt mà mọi dự án lập trình.
- **Ổ đĩa ảo**: 30 GB (Thin-provisioned) sẵn sàng cho PyCharm, Android Studio, Python Packages...
- **Full màn hình**: Tự động nhận diện độ phân giải màn hình máy chủ và co giãn tràn viền (Auto-fit Screen / `Ctrl + Alt + Enter`).
- **Tối ưu VMware**: Đã tắt 3D MKS DirectX để tương thích tuyệt đối với mọi cạc đồ họa mà không bị lỗi crash.

---

## 📁 Cấu trúc thư mục

```text
C:\MAYAOLINUX\
├── Lubuntu.vmx            # File cấu hình máy ảo Lubuntu cho VMware Workstation
├── Lubuntu.vmxf           # File metadata XML
├── Lubuntu.vmdk           # Ổ đĩa ảo 30GB (thin-provisioned)
├── lubuntu.iso            # File ISO cài đặt Lubuntu 22.04 LTS
├── Start-VM.bat           # Script 1-click mở máy ảo trong VMware
├── Download-Lubuntu.ps1   # Script tải ISO có hỗ trợ resume
├── Install-Guide.md       # Sổ tay hướng dẫn cài đặt Lubuntu và PyCharm chi tiết
└── README.md              # Giới thiệu dự án
```

---

## ⚡ Khởi động máy ảo

1. Mở file [`Start-VM.bat`](file:///C:/MAYAOLINUX/Start-VM.bat) hoặc mở VMware Workstation chọn [`Lubuntu.vmx`](file:///C:/MAYAOLINUX/Lubuntu.vmx).
2. Xem hướng dẫn cài đặt và cài PyCharm tại: [`Install-Guide.md`](file:///C:/MAYAOLINUX/Install-Guide.md).

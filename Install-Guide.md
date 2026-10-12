# Hướng dẫn sử dụng Tiny Core Linux 64-bit trên VMware Workstation

## 1. Tổng quan về Tiny Core Linux
**Tiny Core Linux** là bản phân phối Linux nhẹ nhất thế giới có giao diện đồ họa (GUI):
- **Dung lượng file ISO**: ~32 MB (`TinyCorePure64.iso`).
- **RAM sử dụng khi khởi động**: Chỉ khoảng 50MB - 70MB RAM.
- **Tốc độ khởi động**: Dưới 3 giây từ lúc bật máy ảo.
- **Cơ chế hoạt động**: Chạy 100% trong bộ nhớ RAM (RAM-disk), đảm bảo tốc độ phản hồi cực nhanh và không sợ bị hỏng hệ điều hành khi tắt đột ngột.

---

## 2. Cách khởi động máy ảo

### Cách 1: Khởi động nhanh (Khuyên dùng)
- Nhấp đúp chuột vào file `Start-VM.bat` tại thư mục `C:\MAYAOLINUX`.
- VMware Workstation sẽ tự động mở lên và bật nguồn máy ảo ngay lập tức.

### Cách 2: Mở trực tiếp trong VMware Workstation
1. Mở phần mềm **VMware Workstation**.
2. Chọn menu **File** -> **Open...** (hoặc nhấn `Ctrl + O`).
3. Điều hướng tới `C:\MAYAOLINUX` và chọn file `TinyCoreLinux.vmx`.
4. Nhấn nút **Power on this virtual machine** (nút Play màu xanh).

### Cách 3: Dùng PowerShell script
```powershell
# Bật máy ảo có giao diện:
.\manage-vm.ps1 -Action Start

# Bật máy ảo chạy nền (chạy ngầm không hiện cửa sổ):
.\manage-vm.ps1 -Action Start -NoGui

# Kiểm tra trạng thái máy ảo:
.\manage-vm.ps1 -Action Status

# Tắt máy ảo an toàn:
.\manage-vm.ps1 -Action Stop
```

---

## 3. Giao diện và các thao tác cơ bản

Khi máy ảo khởi động lên màn hình Desktop:
- **Thanh Dock (wbar)** nằm ở cạnh dưới màn hình với các biểu tượng:
  - **Terminal (Aterm)**: Mở cửa sổ dòng lệnh Linux.
  - **Apps**: Quản lý và cài đặt gói ứng dụng (Package Manager).
  - **ControlPanel**: Bảng điều khiển hệ thống (Mạng, màn hình, người dùng, sao lưu...).
  - **Exit**: Tắt máy (Shutdown) hoặc Khởi động lại (Reboot).
- **Menu chuột phải**: Nhấp chuột phải vào bất kỳ vị trí trống nào trên Desktop để mở Menu ứng dụng và tác vụ.

---

## 4. Cách cài đặt phần mềm & kết nối mạng

### Kết nối mạng
Máy ảo đã được cấu hình cạc mạng NAT (`e1000`), tự động nhận IP từ máy chủ Windows qua DHCP và có internet ngay khi khởi động.
Để kiểm tra mạng trong Terminal:
```sh
ping -c 3 google.com
```

### Cài đặt ứng dụng qua giao diện đồ họa (Apps GUI)
1. Bấm vào biểu tượng **Apps** trên thanh Dock.
2. Chọn **Apps** -> **Cloud (Remote)** -> **Browse**.
3. Tìm kiếm ứng dụng bạn cần (ví dụ: `firefox`, `leafpad`, `htop`, `git`, `curl`...).
4. Chọn chế độ nạp: **OnBoot** (tự nạp mỗi khi mở máy) và bấm **Go**.

### Cài đặt ứng dụng qua dòng lệnh (CLI)
Sử dụng công cụ `tce-load`:
```sh
# Cập nhật danh sách gói:
tce-update

# Cài đặt trình soạn thảo Leafpad:
tce-load -wi leafpad

# Cài đặt trình duyệt Firefox:
tce-load -wi firefox

# Cài đặt Git và cURL:
tce-load -wi git curl
```

---

## 5. Cách lưu dữ liệu hoặc cài đặt lên ổ đĩa cứng vĩnh viễn (TC-Install)

Tiny Core chạy mặc định trong RAM, do đó các thay đổi cài đặt sẽ mất đi khi tắt máy trừ khi bạn cấu hình Backup hoặc cài trực tiếp lên ổ cứng 10GB (`TinyCoreLinux.vmdk`) đã tạo sẵn:

### Cài đặt Tiny Core lên ổ đĩa cứng (`TinyCoreLinux.vmdk`):
1. Trong Tiny Core Desktop, mở **Apps**.
2. Tìm và cài đặt công cụ: `tc-install-GUI` (hoặc mở Terminal chạy `tce-load -wi tc-install-GUI`).
3. Mở **tc-install** từ menu.
4. Chọn mục tiêu cài đặt là ổ đĩa cứng `/dev/sda`.
5. Chọn định dạng **ext4** và bấm **Proceed**.
6. Sau khi cài xong, bạn có thể tháo file ISO ra khỏi máy ảo và máy sẽ tự boot trực tiếp từ ổ cứng `TinyCoreLinux.vmdk`.

### Hoặc sử dụng tính năng Persistence Backup của Tiny Core:
Khi bấm nút **Exit** (biểu tượng tắt máy), chọn chế độ **Backup** để Tiny Core tự động nén thư mục cá nhân `/home/tc` và lưu vào đĩa cứng. Khi khởi động lại, máy sẽ tự động phục hồi toàn bộ dữ liệu.

# Hướng dẫn sử dụng Lubuntu 64-bit trên VMware Workstation

## 1. Thông số máy ảo
- **Hệ điều hành**: Lubuntu 22.04 LTS 64-bit (Môi trường LXQt siêu nhẹ).
- **RAM**: 4096 MB (4 GB) — cấu hình lý tưởng để vừa nhẹ vừa chạy mượt mà PyCharm / VS Code.
- **CPU**: 2 vCPUs.
- **Ổ cứng**: 30 GB (Thin-provisioned) — chứa thoải mái hệ điều hành, Python, PyCharm và các thư viện.
- **Đồ họa**: Tự động hỗ trợ **Full màn hình (Auto-resize)** nét căng theo cửa sổ VMware.

---

## 2. Cách khởi động máy ảo

1. Mở phần mềm **VMware Workstation**.
2. Chọn menu **File** -> **Open...** -> chọn [`C:\MAYAOLINUX\Lubuntu.vmx`](file:///C:/MAYAOLINUX/Lubuntu.vmx).
3. Hoặc nhấp đúp vào file [`Start-VM.bat`](file:///C:/MAYAOLINUX/Start-VM.bat) tại thư mục `C:\MAYAOLINUX`.
4. Nhấn nút **Power on this virtual machine** (nút Play màu xanh ▶️).

---

## 3. Cài đặt hệ điều hành (Chỉ làm 1 lần đầu)

Khi máy ảo khởi động từ ISO Lubuntu:
1. Màn hình khởi động sẽ hiển thị: chọn **Try or Install Lubuntu**.
2. Trên màn hình Desktop, nhấp đúp chuột vào biểu tượng **Install Lubuntu 22.04 LTS**.
3. Các bước cài đặt:
   - **Language**: Chọn *English* (hoặc *Tiếng Việt*).
   - **Location / Timezone**: Chọn *Asia/Ho_Chi_Minh*.
   - **Partitions**: Chọn **Erase disk** (xóa đĩa ảo 30GB đã tạo sẵn, an toàn tuyệt đối, không ảnh hưởng đến ổ thật của Windows).
   - **User info**: Đặt tên tài khoản và mật khẩu theo ý bạn.
4. Bấm **Install** -> Chờ khoảng 2-3 phút là cài xong hoàn toàn!
5. Sau khi khởi động lại, máy ảo sẽ tự động boot từ ổ đĩa cứng 30GB vĩnh viễn.

---

## 4. Bật chế độ Full màn hình (Auto-fit Screen)

Lubuntu tích hợp sẵn hoặc tự nhận diện VMware Tools:
1. Trong cửa sổ VMware, chọn menu **View** -> tích chọn:
   - **Autofit Window**
   - **Autofit Guest**
2. Nhấn tổ hợp phím **`Ctrl + Alt + Enter`** để vào chế độ Full màn hình tràn toàn bộ màn hình máy tính của bạn.
3. Nếu muốn cài thêm bản VMware Tools mới nhất từ Ubuntu repository, mở Terminal (Ctrl + Alt + T) chạy:
   ```bash
   sudo apt update
   sudo apt install -y open-vm-tools open-vm-tools-desktop
   ```

---

## 5. Hướng dẫn cài đặt PyCharm trên Lubuntu

Sau khi vào Lubuntu, bạn mở Terminal (`Ctrl + Alt + T`) và thực hiện theo 1 trong 2 cách sau:

### Cách 1: Cài PyCharm Community bằng Snap (Khuyên dùng - 1 câu lệnh duy nhất)
```bash
sudo snap install pycharm-community --classic
```
*Sau khi cài xong, biểu tượng PyCharm sẽ xuất hiện ngay trong Menu ứng dụng (Development).*

### Cách 2: Cài PyCharm qua JetBrains Toolbox hoặc tải trực tiếp
```bash
# Cài đặt Python 3, pip và môi trường ảo venv:
sudo apt update
sudo apt install -y python3 python3-pip python3-venv git
```

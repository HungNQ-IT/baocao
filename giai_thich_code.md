# Giải Thích Các Hàm Trong Code Mô Phỏng Quỹ Đạo Tên Lửa

## 1. Các Hàm Cơ Bản MATLAB/Octave

### `clc`
- **Chức năng:** Xóa màn hình Command Window
- **Mục đích:** Làm sạch output trước khi chạy chương trình mới

### `clear`
- **Chức năng:** Xóa tất cả biến trong workspace
- **Mục đích:** Đảm bảo không có biến cũ ảnh hưởng đến chương trình

### `input(prompt)`
- **Chức năng:** Hiển thị prompt và chờ người dùng nhập giá trị
- **Ví dụ:** `dm_dt = input('Nhập tốc độ đốt nhiên liệu: ')`
- **Trả về:** Giá trị số mà người dùng nhập vào

### `disp(text)`
- **Chức năng:** Hiển thị text ra màn hình
- **Ví dụ:** `disp('Tên lửa đặt tại mặt đất')`

### `num2str(number)`
- **Chức năng:** Chuyển số thành chuỗi ký tự
- **Ví dụ:** `num2str(9.81)` → `'9.81'`
- **Mục đích:** Dùng để ghép số vào chuỗi text khi hiển thị

---

## 2. Các Hàm Tạo Vector

### `linspace(start, end, n)`
- **Chức năng:** Tạo vector gồm n phần tử cách đều từ start đến end
- **Ví dụ:** `linspace(0, 10, 5)` → `[0, 2.5, 5, 7.5, 10]`
- **Trong code:** Tạo vector thời gian để tính toán

### `ones(size(vector))`
- **Chức năng:** Tạo vector/matrix toàn số 1 có kích thước bằng vector đầu vào
- **Ví dụ:** `ones(size([1,2,3]))` → `[1, 1, 1]`
- **Trong code:** Tạo vector hằng số (như gia tốc g không đổi)

### `size(vector)`
- **Chức năng:** Trả về kích thước của vector/matrix
- **Ví dụ:** `size([1,2,3,4])` → `[1, 4]` (1 hàng, 4 cột)

---

## 3. Các Hàm Tính Toán

### `cumtrapz(x, y)`
- **Chức năng:** Tích phân số bằng phương pháp hình thang tích lũy
- **Công thức:** ∫y dx ≈ Σ (y[i] + y[i+1])/2 × (x[i+1] - x[i])
- **Ví dụ:** 
  - `cumtrapz([0,1,2], [1,2,3])` tính tích phân từng bước
  - Trả về vector các giá trị tích phân tích lũy
- **Trong code:**
  - Tính vận tốc từ gia tốc: `v = cumtrapz(t, a)`
  - Tính độ cao từ vận tốc: `h = cumtrapz(t, v)`

### `abs(x)`
- **Chức năng:** Trả về giá trị tuyệt đối
- **Ví dụ:** `abs(-10)` → `10`
- **Trong code:** `abs(dm_dt)` vì dm_dt là số âm

### `log(x)`
- **Chức năng:** Logarit tự nhiên (ln)
- **Ví dụ:** `log(2.718)` ≈ `1`

---

## 4. Các Hàm Tìm Kiếm

### `find(condition, n, 'first')`
- **Chức năng:** Tìm n chỉ số đầu tiên thỏa điều kiện
- **Ví dụ:** `find([5,2,8,1] < 3, 2, 'first')` → `[2, 4]` (vị trí của 2 và 1)
- **Trong code:** Tìm thời điểm tên lửa chạm đất (h ≤ 0)

### `isempty(x)`
- **Chức năng:** Kiểm tra x có rỗng không
- **Trả về:** `true` nếu rỗng, `false` nếu không
- **Trong code:** Kiểm tra có tìm thấy điểm chạm đất không

---

## 5. Các Hàm Vẽ Đồ Thị

### `figure('visible', 'off')`
- **Chức năng:** Tạo cửa sổ đồ thị mới (ẩn)
- **Tham số:** `'visible', 'off'` - không hiển thị cửa sổ

### `plot(x, y, style, 'LineWidth', width)`
- **Chức năng:** Vẽ đồ thị 2D
- **Tham số:**
  - `x, y`: Dữ liệu trục x và y
  - `style`: Màu và kiểu đường (`'b'` = xanh, `'r'` = đỏ)
  - `'LineWidth', 2`: Độ dày đường = 2

### `title(text)`
- **Chức năng:** Đặt tiêu đề cho đồ thị

### `xlabel(text)` / `ylabel(text)`
- **Chức năng:** Đặt nhãn cho trục x / trục y

### `grid on`
- **Chức năng:** Hiển thị lưới trên đồ thị

### `print -dpng filename.png`
- **Chức năng:** Lưu đồ thị ra file PNG
- **Tham số:** `-dpng` = định dạng PNG

---

## 6. Toán Tử Đặc Biệt

### `./` (Chia từng phần tử)
- **Chức năng:** Chia từng phần tử tương ứng của 2 vector
- **Ví dụ:** `[4,6,8] ./ [2,3,4]` → `[2, 2, 2]`
- **Trong code:** `(-v_ * dm_dt) ./ m_theo_t`

### `.*` (Nhân từng phần tử)
- **Chức năng:** Nhân từng phần tử tương ứng
- **Ví dụ:** `[1,2,3] .* [4,5,6]` → `[4, 10, 18]`

### `[ ]` (Ghép vector)
- **Chức năng:** Ghép nhiều vector thành 1
- **Ví dụ:** `[[1,2], [3,4]]` → `[1, 2, 3, 4]`
- **Trong code:** Ghép 3 giai đoạn bay lại

### `(2:end)` (Slicing)
- **Chức năng:** Lấy từ phần tử thứ 2 đến cuối
- **Mục đích:** Tránh trùng lặp điểm nối khi ghép vector

---

## 7. Cấu Trúc Điều Khiển

### `while condition ... end`
- **Chức năng:** Lặp khi điều kiện còn đúng
- **Trong code:** Kiểm tra và yêu cầu nhập lại nếu giá trị không hợp lệ

### `if condition ... else ... end`
- **Chức năng:** Rẽ nhánh theo điều kiện
- **Trong code:** Xử lý các trường hợp khác nhau (h0 = 0 hay không)

---

## 8. Công Thức Vật Lý Trong Code

### Phương trình Tsiolkovsky (Giai đoạn 1)
```
m × dv/dt = -v' × dm/dt - m × g
```
- `m`: Khối lượng tên lửa tại thời điểm t
- `v'`: Vận tốc đẩy khí
- `dm/dt`: Tốc độ đốt nhiên liệu (âm)
- `g`: Gia tốc trọng trường

### Chuyển động rơi tự do (Giai đoạn 2 & 3)
```
dv/dt = -g
dh/dt = v
```

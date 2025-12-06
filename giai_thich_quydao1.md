# Giải Thích Code Mô Phỏng Quỹ Đạo Tên Lửa (quydao1.py - thực chất là MATLAB)

## Tổng Quan
Code này mô phỏng chuyển động của tên lửa theo **3 giai đoạn**:
1. **Giai đoạn 1**: Tên lửa đốt nhiên liệu và bay lên
2. **Giai đoạn 2**: Hết nhiên liệu, tên lửa tiếp tục bay lên do quán tính (cho đến khi v = 0)
3. **Giai đoạn 3**: Tên lửa rơi tự do xuống đất

---

## Phần 1: Khởi Tạo và Nhập Dữ Liệu

```matlab
g = 9.81;                    % Gia tốc trọng trường
dm_dt = input(...)           % Tốc độ đốt nhiên liệu (kg/s) - giá trị ÂM vì khối lượng giảm
m0 = input(...)              % Khối lượng ban đầu (cấu trúc + nhiên liệu)
mt = input(...)              % Khối lượng tên lửa khi hết nhiên liệu (chỉ còn cấu trúc)
h0 = input(...)              % Độ cao ban đầu
v_ = input(...)              % Vận tốc phụt khí (vận tốc tương đối của khí so với tên lửa)
```

**Ý nghĩa vật lý:**
- `dm_dt < 0`: Khối lượng tên lửa giảm theo thời gian khi đốt nhiên liệu
- `v_`: Vận tốc khí phụt ra phía sau, tạo lực đẩy cho tên lửa

---

## Phần 2: Kiểm Tra Điều Kiện Hợp Lệ

```matlab
while dm_dt >= 0    % dm_dt phải âm (khối lượng giảm)
while m0 <= 0       % Khối lượng ban đầu phải dương
while mt >= m0      % Khối lượng rỗng phải nhỏ hơn khối lượng đầy
while v_ <= 0       % Vận tốc phụt khí phải dương
```

---

## Giai Đoạn 1: Đốt Nhiên Liệu (Bay Lên Có Động Cơ)

### Bước 1.1: Tính thời gian đốt hết nhiên liệu

```matlab
t = 1 / dm_dt;
t_het_nhien_lieu = int(t, m, m0, mt);
```

**Công thức:**
$$\frac{dm}{dt} = \dot{m} \Rightarrow dt = \frac{dm}{\dot{m}}$$

$$t_{hết} = \int_{m_0}^{m_t} \frac{1}{\dot{m}} dm = \frac{m_t - m_0}{\dot{m}}$$

**Ý nghĩa:** Tính thời gian để khối lượng giảm từ `m0` xuống `mt`

### Bước 1.2: Tính khối lượng theo thời gian

```matlab
m_theo_t = m0 + cumtrapz(t_vector, dm_dt_vector);
```

**Công thức:**
$$m(t) = m_0 + \int_0^t \dot{m} \, dt = m_0 + \dot{m} \cdot t$$

### Bước 1.3: Tính vận tốc theo thời gian (Phương trình Tsiolkovsky)

```matlab
dv_dt_vector = ((-v_ * dm_dt) ./ m_theo_t) - g;
v_theo_t = cumtrapz(t_vector, dv_dt_vector);
```

**Phương trình chuyển động tên lửa:**
$$m \frac{dv}{dt} = -v' \frac{dm}{dt} - mg$$

Trong đó:
- $-v' \frac{dm}{dt}$: Lực đẩy (thrust) - do `dm/dt < 0` và `v' > 0` nên lực đẩy hướng lên
- $-mg$: Trọng lực kéo xuống

**Suy ra:**
$$\frac{dv}{dt} = \frac{-v' \cdot \dot{m}}{m(t)} - g$$

### Bước 1.4: Tính độ cao theo thời gian

```matlab
h_theo_t = h0 + cumtrapz(t_vector, v_theo_t);
```

**Công thức:**
$$h(t) = h_0 + \int_0^t v(t) \, dt$$

---

## Giai Đoạn 2: Bay Lên Theo Quán Tính (Hết Nhiên Liệu)

Sau khi hết nhiên liệu, tên lửa chỉ chịu tác dụng của trọng lực.

### Bước 2.1: Tính thời gian bay lên thêm

```matlab
dt = -1/g * ones(size(v_vector_len_dinh));
t_bay_len_them = cumtrapz(v_vector_len_dinh, dt);
```

**Phương trình:**
$$\frac{dv}{dt} = -g \Rightarrow dt = -\frac{dv}{g}$$

$$t_{lên đỉnh} = \int_{v_{hết NL}}^{0} -\frac{1}{g} dv = \frac{v_{hết NL}}{g}$$

### Bước 2.2: Tính vận tốc và độ cao

```matlab
v_len_dinh = v_het_nhien_lieu + cumtrapz(t_vector_len_them, dv_dt_len_dinh_vector);
h_len_dinh = h_het_nhien_lieu + cumtrapz(t_vector_len_them, v_len_dinh);
```

**Công thức:**
$$v(t) = v_{hết NL} - g \cdot (t - t_{hết NL})$$
$$h(t) = h_{hết NL} + \int v(t) \, dt$$

---

## Giai Đoạn 3: Rơi Tự Do

Tên lửa đạt độ cao cực đại (v = 0) và bắt đầu rơi xuống.

```matlab
h_max = h_len_dinh(end);
dv_dt_roi_vector = -g * ones(size(t_vector_roi));
v_roi = cumtrapz(t_vector_roi, dv_dt_roi_vector);
h_roi = h_max + cumtrapz(t_vector_roi, v_roi);
```

**Phương trình:**
$$v(t) = -g \cdot (t - t_{đỉnh})$$ (vận tốc âm = đi xuống)
$$h(t) = h_{max} - \frac{1}{2}g(t - t_{đỉnh})^2$$

---

## Phần Cuối: Ghép Dữ Liệu và Vẽ Đồ Thị

### Ghép các vector

```matlab
t_full = [t_vector, t_vector_len_them(2:end), t_vector_roi(2:end)];
v_full = [v_theo_t, v_len_dinh(2:end), v_roi(2:end)];
h_full = [h_theo_t, h_len_dinh(2:end), h_roi(2:end)];
```

**Lưu ý:** Bỏ phần tử đầu `(2:end)` để tránh trùng lặp điểm nối giữa các giai đoạn.

### Xác định điểm chạm đất

```matlab
all = find(h_full <= 0, 2, 'first');
```

Tìm thời điểm độ cao = 0 (chạm đất) và cắt dữ liệu tại đó.

### Vẽ đồ thị

- **Đồ thị 1:** Vận tốc v(t) theo thời gian
- **Đồ thị 2:** Độ cao h(t) theo thời gian

---

## Tóm Tắt Các Biến Quan Trọng

| Biến | Ý nghĩa |
|------|---------|
| `dm_dt` | Tốc độ đốt nhiên liệu (kg/s), giá trị âm |
| `m0` | Khối lượng ban đầu (kg) |
| `mt` | Khối lượng khi hết nhiên liệu (kg) |
| `v_` | Vận tốc phụt khí (m/s) |
| `t_het_nhien_lieu` | Thời gian đốt hết nhiên liệu (s) |
| `v_het_nhien_lieu` | Vận tốc khi hết nhiên liệu (m/s) |
| `h_max` | Độ cao cực đại (m) |

---

## Sơ Đồ Tổng Quan

```
     ↑ Độ cao
     │
     │         ★ Đỉnh (v=0, h_max)
     │        /  \
     │       /    \
     │      /      \  ← Giai đoạn 3: Rơi tự do
     │     /        \
     │    / ← GĐ 2   \
     │   /            \
     │  / ← Giai đoạn 1 \
     │ /   (đốt NL)      \
     │/____________________\______→ Thời gian
    h0                    Chạm đất
```

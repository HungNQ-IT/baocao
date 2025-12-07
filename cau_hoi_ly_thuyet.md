# CÂU HỎI LÝ THUYẾT - BÁO CÁO MÔ PHỎNG QUỸ ĐẠO TÊN LỬA

## PHẦN 1: CÁC KHÁI NIỆM CƠ BẢN

### 1.1 Về Tên Lửa và Nhiên Liệu
1. **Tại sao tốc độ đốt nhiên liệu dm/dt phải là số âm?**
   - Giải thích ý nghĩa vật lý của dấu âm
   - Liên hệ với sự thay đổi khối lượng theo thời gian

2. **Phân biệt m₀ (khối lượng ban đầu) và mₜ (khối lượng khi hết nhiên liệu)?**
   - Mỗi đại lượng bao gồm những thành phần nào?
   - Tại sao phải có điều kiện mₜ < m₀?

3. **Vận tốc phụt khí v' là gì? Nó khác gì với vận tốc của tên lửa?**
   - Giải thích khái niệm vận tốc tương đối
   - Tại sao v' phải dương?

### 1.2 Về Chuyển Động
4. **Giải thích tại sao chọn chiều dương hướng lên trong bài toán này?**
   - Ảnh hưởng đến dấu của các đại lượng nào?
   - Nếu chọn chiều dương hướng xuống thì phương trình thay đổi như thế nào?

5. **Gia tốc trọng trường g = 9.81 m/s² có thay đổi theo độ cao không?**
   - Trong bài toán này có xét đến sự thay đổi của g không? Tại sao?
   - Khi nào cần xét đến sự thay đổi của g?

---

## PHẦN 2: PHƯƠNG TRÌNH CHUYỂN ĐỘNG TÊN LỬA

### 2.1 Phương Trình Tsiolkovsky
6. **Viết và giải thích phương trình chuyển động của tên lửa:**
   ```
   m × dv/dt = -v' × dm/dt - m × g
   ```
   - Giải thích từng số hạng trong phương trình
   - Tại sao có dấu âm trước v' × dm/dt?
   - Số hạng nào là lực đẩy? Số hạng nào là trọng lực?

7. **Từ phương trình trên, suy ra công thức tính gia tốc:**
   ```
   dv/dt = (-v' × dm/dt) / m(t) - g
   ```
   - Giải thích ý nghĩa vật lý của từng thành phần
   - Khi nào gia tốc dương (tên lửa tăng tốc)?
   - Khi nào gia tốc âm (tên lửa giảm tốc)?

8. **Lực đẩy (thrust) của tên lửa được tính như thế nào?**
   - Công thức: F = -v' × dm/dt
   - Tại sao lực đẩy tỉ lệ với tốc độ đốt nhiên liệu?
   - Tại sao lực đẩy tỉ lệ với vận tốc phụt khí?

### 2.2 Định Luật Bảo Toàn Động Lượng
9. **Giải thích nguyên lý hoạt động của tên lửa dựa trên định luật bảo toàn động lượng?**
   - Hệ tên lửa + khí phụt ra
   - Tại sao khí phụt ra phía sau làm tên lửa bay về phía trước?

10. **Phương trình Tsiolkovsky có liên quan gì đến định luật Newton thứ 3?**
    - "Lực tác dụng và phản lực"
    - Giải thích cặp lực tác động trong hệ tên lửa

---

## PHẦN 3: BA GIAI ĐOẠN CHUYỂN ĐỘNG

### 3.1 Giai Đoạn 1: Đốt Nhiên Liệu
11. **Tính thời gian đốt hết nhiên liệu:**
    ```
    t_hết = ∫(m₀ → mₜ) 1/dm_dt × dm = (mₜ - m₀) / dm_dt
    ```
    - Giải thích cách tính tích phân này
    - Tại sao kết quả là dương dù dm/dt âm?

12. **Khối lượng tên lửa thay đổi theo thời gian:**
    ```
    m(t) = m₀ + dm/dt × t
    ```
    - Tại sao dùng dấu cộng dù khối lượng giảm?
    - Vẽ đồ thị m(t) và nhận xét

13. **Trong giai đoạn 1, tên lửa chịu tác dụng của những lực nào?**
    - Liệt kê và phân tích hướng của từng lực
    - Khi nào tổng lực hướng lên? Khi nào hướng xuống?

### 3.2 Giai Đoạn 2: Bay Lên Theo Quán Tính
14. **Tại sao sau khi hết nhiên liệu, tên lửa vẫn tiếp tục bay lên?**
    - Giải thích dựa trên định luật quán tính (Newton 1)
    - Điều kiện để tên lửa bay lên thêm là gì?

15. **Tính thời gian bay lên thêm sau khi hết nhiên liệu:**
    ```
    t_lên_đỉnh = v_hết_NL / g
    ```
    - Suy ra công thức này từ phương trình dv/dt = -g
    - Nếu v_hết_NL = 0 thì điều gì xảy ra?

16. **Trong giai đoạn 2, tên lửa chỉ chịu tác dụng của lực nào?**
    - So sánh với giai đoạn 1
    - Tại sao không còn lực đẩy?

### 3.3 Giai Đoạn 3: Rơi Tự Do
17. **Giải thích chuyển động rơi tự do của tên lửa:**
    - Điều kiện ban đầu: v = 0, h = h_max
    - Phương trình: v(t) = -g×t, h(t) = h_max - ½g×t²

18. **Tại sao vận tốc trong giai đoạn 3 là âm?**
    - Liên hệ với chiều dương đã chọn
    - Ý nghĩa vật lý của dấu âm

19. **So sánh vận tốc khi chạm đất với vận tốc ban đầu (nếu h₀ = 0)?**
    - Có bằng nhau không? Tại sao?
    - Liên hệ với định luật bảo toàn năng lượng

---

## PHẦN 4: PHƯƠNG PHÁP TÍNH TOÁN

### 4.1 Tích Phân Số
20. **Giải thích phương pháp tích phân hình thang (cumtrapz)?**
    - Công thức: ∫y dx ≈ Σ (y[i] + y[i+1])/2 × Δx
    - Tại sao dùng phương pháp số thay vì tích phân giải tích?

21. **Trong code, tại sao dùng cumtrapz để tính vận tốc và độ cao?**
    - Từ gia tốc → vận tốc: v = ∫a dt
    - Từ vận tốc → độ cao: h = ∫v dt
    - Giải thích ý nghĩa vật lý

22. **Tại sao cần chia nhỏ thời gian thành 1000 điểm (linspace)?**
    - Ảnh hưởng đến độ chính xác
    - Nếu dùng ít điểm hơn thì sao?

### 4.2 Xử Lý Dữ Liệu
23. **Tại sao khi ghép các giai đoạn lại phải dùng (2:end)?**
    - Vấn đề trùng lặp điểm nối
    - Ảnh hưởng đến đồ thị nếu không làm vậy

24. **Giải thích cách xác định thời điểm chạm đất:**
    ```
    find(h_full <= 0, 2, 'first')
    ```
    - Tại sao tìm 2 điểm đầu tiên?
    - Trường hợp h₀ = 0 và h₀ > 0 khác nhau như thế nào?

---

## PHẦN 5: PHÂN TÍCH ĐỒ THỊ

### 5.1 Đồ Thị Vận Tốc v(t)
25. **Mô tả dạng đồ thị vận tốc theo thời gian:**
    - Giai đoạn 1: Tăng hay giảm? Tại sao?
    - Giai đoạn 2: Thay đổi như thế nào?
    - Giai đoạn 3: Đặc điểm gì?

26. **Tại điểm nào trên đồ thị v(t) có ý nghĩa đặc biệt?**
    - Điểm v = 0 (đỉnh)
    - Điểm chuyển giai đoạn
    - Điểm chạm đất

27. **Độ dốc của đồ thị v(t) cho biết thông tin gì?**
    - Liên hệ với gia tốc: dv/dt
    - So sánh độ dốc ở các giai đoạn

### 5.2 Đồ Thị Độ Cao h(t)
28. **Mô tả dạng đồ thị độ cao theo thời gian:**
    - Giai đoạn 1: Dạng đường cong gì?
    - Giai đoạn 2: Đặc điểm?
    - Giai đoạn 3: Dạng parabol?

29. **Tại sao độ cao cực đại h_max không đạt được ngay khi hết nhiên liệu?**
    - Giải thích dựa trên quán tính
    - Điều kiện để đạt h_max

30. **Độ dốc của đồ thị h(t) cho biết thông tin gì?**
    - Liên hệ với vận tốc: dh/dt = v
    - Tại đỉnh, độ dốc bằng bao nhiêu?

---

## PHẦN 6: CÁC TRƯỜNG HỢP ĐẶC BIỆT

### 6.1 Điều Kiện Ban Đầu
31. **Nếu h₀ = 0 (tên lửa phóng từ mặt đất), có gì khác so với h₀ > 0?**
    - Cách xác định điểm chạm đất
    - Thời gian bay tổng cộng

32. **Nếu v_hết_NL = 0 (vận tốc bằng 0 ngay khi hết nhiên liệu), điều gì xảy ra?**
    - Giai đoạn 2 còn tồn tại không?
    - Tên lửa có đạt độ cao lớn hơn h_hết_NL không?

33. **Nếu v_hết_NL < 0 (vận tốc âm khi hết nhiên liệu), có hợp lý không?**
    - Trường hợp nào xảy ra điều này?
    - Lực đẩy không đủ mạnh so với trọng lực

### 6.2 Thay Đổi Tham Số
34. **Nếu tăng vận tốc phụt khí v', độ cao cực đại thay đổi như thế nào?**
    - Giải thích dựa trên phương trình Tsiolkovsky
    - Tại sao v' càng lớn thì tên lửa bay càng cao?

35. **Nếu tăng tốc độ đốt nhiên liệu |dm/dt|, ảnh hưởng gì đến quỹ đạo?**
    - Thời gian đốt hết nhiên liệu
    - Lực đẩy
    - Độ cao cực đại

36. **Nếu giảm khối lượng cấu trúc mₜ (giữ nguyên m₀), kết quả thay đổi ra sao?**
    - Nhiên liệu tăng lên
    - Thời gian đốt nhiên liệu
    - Độ cao đạt được

---

## PHẦN 7: ỨNG DỤNG VÀ MỞ RỘNG

### 7.1 Giới Hạn Của Mô Hình
37. **Mô hình này bỏ qua những yếu tố nào?**
    - Lực cản không khí
    - Sự thay đổi của g theo độ cao
    - Góc phóng (chỉ xét phóng thẳng đứng)

38. **Nếu xét đến lực cản không khí, phương trình thay đổi như thế nào?**
    - Thêm số hạng -kv² (lực cản tỉ lệ với v²)
    - Ảnh hưởng đến độ cao cực đại

39. **Nếu xét đến sự thay đổi của g theo độ cao:**
    ```
    g(h) = g₀ × (R/(R+h))²
    ```
    - Khi nào cần xét đến yếu tố này?
    - Ảnh hưởng đến kết quả

### 7.2 Ứng Dụng Thực Tế
40. **Phương trình Tsiolkovsky được ứng dụng trong thiết kế tên lửa như thế nào?**
    - Tính toán nhiên liệu cần thiết
    - Tối ưu hóa tỉ số khối lượng

41. **Tại sao tên lửa thực tế thường có nhiều tầng (multi-stage)?**
    - Lợi ích của việc loại bỏ khối lượng thừa
    - Liên hệ với phương trình Tsiolkovsky

42. **So sánh mô hình này với tên lửa thực tế:**
    - Điểm giống
    - Điểm khác
    - Độ chính xác của mô hình

---

## PHẦN 8: CÂU HỎI TỔNG HỢP

### 8.1 Phân Tích Tổng Thể
43. **Vẽ và giải thích sơ đồ các lực tác dụng lên tên lửa ở từng giai đoạn:**
    - Giai đoạn 1: Lực đẩy + Trọng lực
    - Giai đoạn 2 & 3: Chỉ có trọng lực

44. **Giải thích định luật bảo toàn năng lượng trong bài toán:**
    - Năng lượng hóa học → Động năng + Thế năng
    - Tại đỉnh: Động năng = 0, Thế năng cực đại

45. **Nếu không có trọng lực (g = 0), tên lửa sẽ chuyển động như thế nào?**
    - Giai đoạn 1: Tăng tốc liên tục
    - Giai đoạn 2 & 3: Chuyển động thẳng đều

### 8.2 Câu Hỏi Tính Toán
46. **Cho dữ liệu cụ thể, tính:**
    - Thời gian đốt hết nhiên liệu
    - Vận tốc khi hết nhiên liệu
    - Độ cao cực đại
    - Thời gian bay tổng cộng

47. **Từ đồ thị v(t), làm thế nào để tính độ cao?**
    - Diện tích dưới đồ thị v(t) = độ dời
    - Giải thích bằng tích phân

48. **Từ đồ thị h(t), làm thế nào để tính vận tốc?**
    - Độ dốc của đồ thị h(t) = vận tốc
    - Giải thích bằng đạo hàm

---

## PHẦN 9: CÂU HỎI NÂNG CAO

### 9.1 Toán Học
49. **Giải phương trình Tsiolkovsky bằng phương pháp giải tích:**
    ```
    dv = (-v'/m × dm) - g dt
    ```
    - Tích phân để tìm v(t)
    - Công thức Tsiolkovsky: Δv = v' × ln(m₀/mₜ) - g×t

50. **Chứng minh công thức độ cao cực đại (không xét lực cản):**
    ```
    h_max = h₀ + v'×ln(m₀/mₜ)×t - ½g×t² + v²/(2g)
    ```

### 9.2 Vật Lý
51. **Giải thích hiện tượng "gravity turn" trong phóng tên lửa thực tế:**
    - Tại sao không phóng thẳng đứng suốt quá trình?
    - Lợi ích của việc nghiêng dần quỹ đạo

52. **Tính vận tốc vũ trụ cấp 1 (orbital velocity):**
    - Điều kiện để tên lửa không rơi xuống Trái Đất
    - So sánh với vận tốc đạt được trong mô hình

---

## PHẦN 10: CÂU HỎI VỀ CODE VÀ PHƯƠNG PHÁP

### 10.1 Thuật Toán
53. **Giải thích thuật toán tổng thể của chương trình:**
    - Input → Xử lý → Output
    - Các bước chính

54. **Tại sao cần kiểm tra điều kiện đầu vào (validation)?**
    - Các điều kiện cần kiểm tra
    - Hậu quả nếu không kiểm tra

55. **Giải thích cách ghép 3 giai đoạn thành 1 vector liên tục:**
    - Đảm bảo tính liên tục tại điểm nối
    - Tránh nhảy vọt trong đồ thị

### 10.2 Tối Ưu Hóa
56. **Làm thế nào để tăng độ chính xác của mô phỏng?**
    - Tăng số điểm tính toán
    - Dùng phương pháp tích phân chính xác hơn

57. **Làm thế nào để tối ưu hóa thời gian chạy chương trình?**
    - Giảm số điểm tính toán
    - Vectorization thay vì vòng lặp

---

## GỢI Ý TRẢ LỜI

### Cấu trúc trả lời tốt:
1. **Định nghĩa khái niệm** (nếu có)
2. **Giải thích lý thuyết** (công thức, định luật)
3. **Ví dụ cụ thể** (số liệu từ bài toán)
4. **Liên hệ thực tế** (ứng dụng)

### Các công thức quan trọng cần nhớ:
- Phương trình Tsiolkovsky: `m × dv/dt = -v' × dm/dt - m × g`
- Thời gian đốt hết NL: `t = (mₜ - m₀) / dm_dt`
- Vận tốc lý tưởng: `Δv = v' × ln(m₀/mₜ) - g×t`
- Rơi tự do: `v = -g×t`, `h = h₀ - ½g×t²`

### Lưu ý khi trả lời:
- Giải thích rõ dấu của các đại lượng (âm/dương)
- Chỉ rõ chiều dương đã chọn
- Phân biệt vận tốc tương đối và vận tốc tuyệt đối
- Liên hệ với các định luật Newton

---

**Chúc bạn chuẩn bị tốt và thuyết trình thành công!** 🚀

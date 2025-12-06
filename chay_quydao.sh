#!/bin/bash
echo "=== CHƯƠNG TRÌNH MÔ PHỎNG QUỸ ĐẠO TÊN LỬA ==="
echo ""
echo "Nhập các thông số sau:"
echo ""

read -p "Nhập tốc độ đốt nhiên liệu dm/dt (số âm, VD: -10): " m_
read -p "Nhập khối lượng tên lửa m0 (kg, VD: 1000): " m0
read -p "Nhập vị trí ban đầu h0 (m, VD: 0): " h0
read -p "Nhập vận tốc đẩy khí v_ (m/s, VD: 2500): " v_

echo ""
echo "Đang tính toán và vẽ đồ thị..."
echo ""

octave --no-gui --eval "
g = 9.81;
m_ = $m_;
m0 = $m0;
h0 = $h0;
v_ = $v_;

if m_ >= 0
    disp('Lỗi: Tốc độ đốt nhiên liệu phải là số âm!');
    exit(1);
end

if m0 <= 0
    disp('Lỗi: Khối lượng phải lớn hơn 0!');
    exit(1);
end

if v_ <= 0
    disp('Lỗi: Vận tốc đẩy khí phải lớn hơn 0!');
    exit(1);
end

t_het_nhien_lieu = m0 / abs(m_);

disp('----------------------------------------------------');
disp(['Thông số tốc độ đốt nhiên liệu: ', num2str(m_), ' kg/s']);
disp(['Khối lượng tên lửa: ', num2str(m0), ' kg']);
if h0 == 0
    disp('Tên lửa đặt tại mặt đất');
else 
    disp(['Tên lửa ở độ cao ', num2str(h0), ' m so với mặt đất']);
end
disp(['Vận tốc đẩy khí: ', num2str(v_), ' m/s']);
disp(['Hằng số gia tốc trọng trường: ', num2str(g), ' m/s^2']);
disp(['Thời gian hết nhiên liệu: ', num2str(t_het_nhien_lieu), ' s']);
disp('----------------------------------------------------');

yt = @(t) v_.*(t + m0/m_).*log(m0 ./ (m0 + m_.*t)) + v_.*t - 0.5.*g.*t.^2 + h0;
t = linspace(0, t_het_nhien_lieu, 1000);
y = yt(t);

figure('visible', 'off');
plot(t, y, 'b', 'LineWidth', 2);
title('Đồ thị Độ cao y(t) theo Thời gian t');
xlabel('Thời gian t (s)'); 
ylabel('Độ cao y(t) (m)'); 
grid on;
hold on;
plot(0, h0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
legend('Đường bay y(t)', 'Vị trí ban đầu y(0)');
hold off;

print -dpng quydao_plot.png;
disp('');
disp('✓ Đồ thị đã được lưu vào file: quydao_plot.png');
disp('✓ Mở file để xem kết quả!');
"

if [ -f quydao_plot.png ]; then
    echo ""
    echo "Đang mở đồ thị..."
    open quydao_plot.png
fi

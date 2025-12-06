clc;
clear;

g = 9.81;

% Sử dụng giá trị mẫu thay vì input
m_ = -10;  % Tốc độ đốt nhiên liệu (kg/s) - phải âm
m0 = 1000;  % Khối lượng tên lửa (kg)
h0 = 0;     % Vị trí ban đầu (m)
v_ = 2500;  % Vận tốc đẩy khí (m/s)

disp ('---------------------------------------------------');
disp ('Sử dụng giá trị mẫu:');

t_het_nhien_lieu = m0 / abs(m_);

% Xuất ra màn hình
disp ('----------------------------------------------------')
disp (['Thông số tốc độ đốt nhiên liệu của tên lửa là: ', num2str(m_), ' kg/s']);
disp (['Khối lượng của tên lửa là: ', num2str(m0),' kg']);
if h0 == 0
    disp (['Tên lửa đặt tại mặt đất']);
else 
    disp (['Tên lửa ở độ cao ', num2str(h0), 'm so với mặt đất']);
end
disp (['Vận tốc đẩy khí của tên lửa là: ', num2str(v_)]);
disp (['Hằng số gia tốc trọng trường: ', num2str(g),' m/s^2']);
disp (['Thời gian hết nhiên liệu của tên lửa: ', num2str(t_het_nhien_lieu), ' s']);

% Vẽ đồ thị 2D
yt = @(t) v_.*(t + m0/m_).*log(m0 ./ (m0 + m_.*t) ) + v_.*t - 0.5.*g.* t.^2 + h0;
t = linspace(0, t_het_nhien_lieu , 1000);
y = yt(t);

figure('Name', 'Đồ thị Độ cao của Tên Lửa theo Thời gian');
plot(t, y, 'b', 'LineWidth', 2);
title('Đồ thị Độ cao y(t) theo Thời gian t');
xlabel('Thời gian t (s)'); 
ylabel('Độ cao y(t) (m)'); 
grid on;

hold on;
plot(0, h0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
legend('Đường bay y(t)', 'Vị trí ban đầu y(0)', 'Location', 'best');
hold off;

% Lưu đồ thị
print -dpng quydao_plot.png
disp ('----------------------------------------------------')
disp ('Đồ thị đã được lưu vào file: quydao_plot.png');

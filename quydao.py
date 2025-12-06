clc;
clear;

g = 9.81;
% nhập giá trị
m_ = input ('Nhập thông số tốc độ đốt nhiên liệu của tên lửa dm/dt: ');
m0 = input ('Nhập khối lượng của tên lửa: ');
h0 = input ('Nhập vị trí ban đầu của tên lửa: ');
v_ = input ('Nhập vận tốc đẩy khí của tên lửa: ');
disp ('---------------------------------------------------');

%kiểm tra điều kiện
while m_ >= 0
    disp ('Tên lửa chưa thể bay !!! vui lòng nhập lại');
    m_ = input ('Nhập lại thông số tốc độ đốt nhiên liệu của tên lửa: ');
end
while m0 <= 0
    m0 = input ('Nhập lại khối lượng của tên lửa: ');
end
while v_ <= 0
    v_ = input ('Nhập lại vận tốc đẩy khí của tên lửa: ');
end

t_het_nhien_lieu = m0 / m_;

% xuất ra màn hình
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


%vẽ đồ thị 2D, 3D
yt = @(t) v_.*(t + m0/m_).*log(m0 ./ (m0 + m_.*t) ) + v_.*t - 0.5.*g.* t.^2 + h0;
t = linspace(0, t_het_nhien_lieu , 1000);
y = yt(t);

figure('Name', 'Đồ thị Độ cao của Tên Lửa theo Thời gian');
plot(t, y, 'b', 'LineWidth', 2);
title('Đồ thị Độ cao y(t) theo Thời gian t');
xlabel('Thời gian t (s)'); 
ylabel('Độ cao y(t) (m)'); 
grid on;


% Thêm điểm đánh dấu vị trí ban đầu (optional)
hold on;
plot(0, h0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
legend('Đường bay y(t)', 'Vị trí ban đầu y(0)', 'Location', 'best');
hold off;
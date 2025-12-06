clc;
clear;


g = 9.81;
% nhập giá trị
dm_dt = input ('Nhập thông số tốc độ đốt nhiên liệu của tên lửa dm/dt: ');
m0 = input ('Nhập tổng khối lượng cấu trúc và khối lượng nhiên liệu của tên lửa: ');
mt = input ('Nhập khối lượng của tên lửa khi không tính nhiên liệu: ');
h0 = input ('Nhập vị trí ban đầu của tên lửa: ');
v_ = input ('Nhập vận tốc đẩy khí của tên lửa: ');
disp ('---------------------------------------------------');

%kiểm tra điều kiện
while dm_dt >= 0
    disp ('Tên lửa chưa thể bay !!! vui lòng nhập lại');
    dm_dt = input ('Nhập lại thông số tốc độ đốt nhiên liệu của tên lửa: ');
end
while m0 <= 0
    m0 = input ('Nhập lại tổng khối lượng cấu trúc và khối lượng nhiên liệu của tên lửa: ');
end
while mt >= m0 || mt <=0 
    mt = input ('Nhập lại khối lượng của tên lửa khi không tính nhiên liệu: ');
end
while v_ <= 0
    v_ = input ('Nhập lại vận tốc đẩy khí của tên lửa: ');
end



% xuất ra màn hình
disp ('----------------------------------------------------')
disp (['Thông số tốc độ đốt nhiên liệu của tên lửa là: ', num2str(dm_dt), ' kg/s']);
disp (['Tổng khối lượng cấu trúc và khối lượng nhiên liệu của tên lửa là: ', num2str(m0),' kg']);
disp (['Khối lượng của tên lửa khi không tính nhiên liệu: ', num2str(mt),' kg']);
if h0 == 0
    disp ('Tên lửa đặt tại mặt đất');
else 
    disp (['Tên lửa ở độ cao ', num2str(h0), 'm so với mặt đất']);
end
disp (['Vận tốc đẩy khí của tên lửa là: ', num2str(v_),' m/s']);
disp (['Hằng số gia tốc trọng trường: ', num2str(g),' m/s^2']);


% giai đoạn từ lúc đầu đến lúc hết nhiên liệu (giai đoạn 1)

% Tính thời gian hết nhiên liệu: t = (m0 - mt) / |dm_dt|
t_het_nhien_lieu = (m0 - mt) / abs(dm_dt);
disp (['Thời gian đốt hết nhiên liệu của tên lửa: ', num2str(t_het_nhien_lieu), ' s']);

t_vector = linspace(0, t_het_nhien_lieu, 1000);
 % dm/dt = dm_dt --> dm = dm_dt * dt --> mt - m0 = dm_dt * t_het_nhien_lieu
dm_dt_vector = dm_dt * ones(size(t_vector));
m_theo_t = m0 + cumtrapz(t_vector, dm_dt_vector);
disp (['Khối lượng mất đi khi đốt hết nhiên liệu của tên lửa: ',num2str(m_theo_t(1) - m_theo_t(end)), ' kg']);


% m_theo_t * dv/dt = ( -v' * dm/dt ) - m_theo_t *g
% --> dv = [(( -v' * dm/dt ) / m_theo_t) - g ] * dt
dv_dt_vector = ( (-v_ * dm_dt) ./ m_theo_t ) - g;
v_theo_t = cumtrapz(t_vector, dv_dt_vector);
disp (['Vận tốc khi đốt hết nhiên liệu của tên lửa: ', num2str(v_theo_t(end)),' m/s']);


h_theo_t = h0 + cumtrapz(t_vector, v_theo_t);

% giai đoạn 2
v_het_nhien_lieu = v_theo_t(end); 
h_het_nhien_lieu = h_theo_t(end); 
t_start_giai_doan_2 = t_het_nhien_lieu;

v_vector_len_dinh = linspace(v_het_nhien_lieu, 0, 1000);
if v_het_nhien_lieu > 0
% dv/dt = - g --> dt = -1 / g  * dv  -->  t_bay_len_them - 0 = -1 / g * ( 0 - v_het_nhien_lieu )
    dt = -1 / g * ones(size(v_vector_len_dinh)); % Thời gian từ lúc hết nhiên liệu đến lúc v=0
    t_bay_len_them =  cumtrapz(v_vector_len_dinh, dt);
else
    t_bay_len_them = 0; 
end
t_len_dinh = t_start_giai_doan_2 + t_bay_len_them(end); % Tổng thời gian đến đỉnh

t_vector_len_them = linspace(t_start_giai_doan_2, t_len_dinh, 1000);

% dv/dt = -g ( a = -g ; chọn chiều dương hướng lên )
% dv = -g * dt --> v_len_dinh - v_het_nhien_lieu = -g * ( t_vector_len_them - 0 )
dv_dt_len_dinh_vector = -g * ones(size(t_vector_len_them));
v_len_dinh = v_het_nhien_lieu + cumtrapz(t_vector_len_them, dv_dt_len_dinh_vector);

% dh/dt = v_len_dinh --> dh = v_len_dinh * dt --> h_len_dinh - h_het_nhien_lieu = v_len_dinh * ( t_vector_len_them - 0 )
h_len_dinh = h_het_nhien_lieu + cumtrapz(t_vector_len_them, v_len_dinh);


% giai đoạn 3
h_max =  h_len_dinh(end);
t_vector_roi = linspace(t_len_dinh, 500, 1000); 
% dv/dt = -g ( a = -g ; chọn chiều dương hướng lên )
% dv = -g * dt --> v_roi - 0 = -g * ( t_vector_roi - 0 )
dv_dt_roi_vector = -g * ones(size(t_vector_roi));
v_roi = cumtrapz(t_vector_roi, dv_dt_roi_vector);

% dh/dt = v_roi --> dy = v_roi * dt--> h_roi - h_max = v_roi * ( t_vector_roi - 0 )
h_roi = h_max + cumtrapz( t_vector_roi, v_roi);

% Gộp vector ở các giai đoạn lại
t_full = [t_vector, t_vector_len_them(2:end), t_vector_roi(2:end)];
v_full = [v_theo_t, v_len_dinh(2:end), v_roi(2:end)];
h_full = [h_theo_t, h_len_dinh(2:end), h_roi(2:end)];

all = find(h_full <= 0, 2, 'first');
if h0 == 0
    h_cham_dat = all(2);
else
    h_cham_dat = all(1);
end

if ~isempty(h_cham_dat)
    % Cắt các vector từ đầu đến chỉ mục chạm đất
    t_full = t_full(1:h_cham_dat);
    v_full = v_full(1:h_cham_dat);
    h_full = h_full(1:h_cham_dat);
    h_full(end) = 0; 
end
%vẽ đồ thị 2D và lưu ra file
figure('visible', 'off');
plot(t_full, v_full, 'b', 'LineWidth', 2);
title('Đồ thị Vận tốc v(t) theo Thời gian t');
xlabel('Thời gian t (s)'); 
ylabel('Vận tốc v (m/s)'); 
grid on;
print -dpng van_toc.png;
disp('Đã lưu đồ thị vận tốc: van_toc.png');

figure('visible', 'off');
plot(t_full, h_full, 'r', 'LineWidth', 2);
title('Đồ thị Độ cao y(t) theo Thời gian t');
xlabel('Thời gian t (s)'); 
ylabel('Độ cao y (m)'); 
grid on;
print -dpng do_cao.png;
disp('Đã lưu đồ thị độ cao: do_cao.png');

disp('');
disp('Mở file ảnh để xem đồ thị!');
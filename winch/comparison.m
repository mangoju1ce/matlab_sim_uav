% 要加载的数据文件
height_list = [25, 30, 35];  % 入射高度列表
colors = {'b', 'r', 'g'};  % 蓝 红 绿
labels = {'25 m', '30 m', '35 m'};  % 图例标签

hold on;

for i = 1:length(height_list)
    h = height_list(i);
    filename = ['v_plane_h' num2str(h) '.mat'];  % 假设文件命名仍然按 m 数字命名
    
    if isfile(filename)
        data = load(filename);  % 加载 t 和 v
        plot(data.t, data.v(:,1), 'Color', colors{i}, 'DisplayName', labels{i});
    else
        warning('未找到文件：%s', filename);
    end
end

xlabel('时间 / s');
ylabel('速度 / m·s^{-1}');
title('不同入射高度下的x方向速度曲线');
legend('Location', 'best');
grid on;
hold off;
saveas(gcf, fullfile('result', 'v_plane_height_compare.png'));  
% 要加载的数据文件
height_list = [25, 30, 35];  % 入射高度列表
colors = [0.2 0.4 0.6; 0.5 0.2 0.1; 0.3 0.6 0.3];  % 柔和、易分辨的颜色
labels = {'25 m', '30 m', '35 m'};  % 图例标签

hold on;

for i = 1:length(height_list)
    h = height_list(i);
    filename = ['v_plane_h' num2str(h) '.mat'];  % 假设仍按 m 命名保存
    
    if isfile(filename)
        data = load(filename);  % 加载 t 和 v
        t = data.t;
        vx = data.v(:,1);
        
        % 画图
        plot(t, vx, 'Color', colors(i,:), 'DisplayName', labels{i});
        
        % 查找第一个过零点
        sign_change_idx = find(diff(sign(vx)) ~= 0, 1);
        if ~isempty(sign_change_idx)
            t_zero = interp1(vx(sign_change_idx:sign_change_idx+1), ...
                             t(sign_change_idx:sign_change_idx+1), 0);
            fprintf('高度 %dm 的速度曲线第一个零点出现在 %.3f s\n', h, t_zero);
        else
            fprintf('高度 %dm 的速度曲线没有穿越零点\n', h);
        end
        
    else
        warning('未找到文件：%s', filename);
    end
end

xlabel('时间 / s');
ylabel('速度 / m·s^{-1}');
title('不同入射高度下的 x 方向速度曲线');
legend('Location', 'best');
grid on;
hold off;



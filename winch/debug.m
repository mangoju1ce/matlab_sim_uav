% 设置模型名称
modelName = 'arithmetic2023';  % 替换为你的模型名（不加 .slx）

% 运行模型
out = sim(modelName, 'SaveOutput','on');

% 从上一次仿真结果中提取位置数据
plane_ts = out.r_plane;   % timeseries 类型
drone_ts = out.r_drone;

% 指定时刻
times_to_mark = [1.5, 2, 3, 4, 5];

% 获取每个时间点的位置
plane_pos = interp1(plane_ts.Time, plane_ts.Data, times_to_mark);
drone_pos = interp1(drone_ts.Time, drone_ts.Data, times_to_mark);

% 准备颜色（足够区分）
colors = lines(length(times_to_mark));  % colormap

figure;
hold on;
axis equal;
grid on;
xlabel('x (m)', 'Interpreter','none');
ylabel('y (m)', 'Interpreter','none');
title('Selected Positions and Connections', 'Interpreter','none');

for i = 1:length(times_to_mark)
    t = times_to_mark(i);
    color = colors(i, :);

    r_p = plane_pos(i, :);   % r_plane(t)
    r_d = drone_pos(i, :);   % r_drone(t)

    % 标记 plane 位置
    plot(r_p(1), r_p(2), 'o', 'Color', color, 'MarkerFaceColor', color, ...
        'DisplayName', ['plane @ t=' num2str(t) 's']);

    % 标记 drone 位置
    plot(r_d(1), r_d(2), 'x', 'Color', color, 'LineWidth', 1.5, ...
        'DisplayName', ['drone @ t=' num2str(t) 's']);

    % 连线：原点 -> plane
    plot([0, r_p(1)], [0, r_p(2)], '-', 'Color', color, 'LineWidth', 1);

    % 连线：plane -> drone
    plot([r_p(1), r_d(1)], [r_p(2), r_d(2)], '--', 'Color', color, 'LineWidth', 1.2);

    % 在 plane->drone 连线中间写上时刻
    mid = (r_p + r_d) / 2;
    text(mid(1), mid(2), ['t = ' num2str(t) 's'], ...
        'Color', color, 'FontSize', 10, 'FontWeight','bold');
end

legend('Interpreter','none', 'Location','bestoutside');
saveas(gcf, 'r_connection_times.pdf');

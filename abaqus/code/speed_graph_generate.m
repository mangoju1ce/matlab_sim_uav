% 读取 Excel 文件
filename = 'planespeed.xlsx'; % 替换为你的 Excel 文件名
data = readtable(filename);

% 提取相关列
t = data.t;
speed = data.("v");
vx = data.("vx");
vy = data.("vy");

% 创建图像并绘图
figure;
plot(t, speed, 'b-', 'LineWidth', 1.5); hold on;

% 使用柔和深紫和青绿色
plot(t, vx, 'Color', [0.5 0.2 0.5], 'LineWidth', 1.5); % 深紫色
plot(t, vy, 'Color', [0 0.5 0.5], 'LineWidth', 1.5);   % 青绿色

% 添加 t = 1 竖线
xline(1, 'k--', 'LineWidth', 1.2); % 黑色虚线

% 竖线旁边加注释文字（向上偏移一些）
y_range = max([speed; vx; vy]) - min([speed; vx; vy]);
text(1 + 0.05 * (max(t) - min(t)), min([speed; vx; vy]) + 0.9 * y_range, ...
    't = 1', ...
    'VerticalAlignment', 'bottom', ...
    'HorizontalAlignment', 'right', ...
    'Color', 'k');

% 添加图例和标签
xlabel('Time / s');
ylabel('Speed / m*s^{-1} ');
title('固定翼飞机速度曲线');
legend('v', 'v_x', 'v_y', 'Location', 'best');
grid on;

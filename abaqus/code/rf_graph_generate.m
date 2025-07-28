% 读取 Excel 文件
filename = 'detail-final-rftest.xlsx'; % 替换为你的 Excel 文件名
data = readtable(filename);

% 提取四列数据（确保列名与 Excel 文件一致）
t = data.t;
rf_magnitude = data.("rf_mag");
rf1 = data.("rf1");
rf2 = data.("rf2");
rf3 = data.("rf3");

% 创建图像并绘图
figure;
plot(t, rf_magnitude, 'b-', 'LineWidth', 1.5); hold on;
plot(t, rf1, 'Color', 	[0.5 0.2 0.5], 'LineStyle', '--', 'LineWidth', 1.5); % 深灰色，虚线
plot(t, rf2, 'Color', [0 0.5 0], 'LineStyle', '-.', 'LineWidth', 1.5);     % 深绿色，点划线

% 标注 rf-magnitude 最大值
[maxVal, idx] = max(rf_magnitude);
plot(t(idx), maxVal, 'ko', 'MarkerFaceColor', 'k');
text(t(idx), maxVal, sprintf('Max: %.2f', maxVal), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');

% 添加 y = 6300 横线
yline(6300, 'k:', 'LineWidth', 1.8);

% 文字位置调到横线下方，向右移动（x方向偏移0.02个横坐标范围）
x_range = max(t) - min(t);
text(t(1) + 0.12 * x_range, 6300 - 50, 'y = 6300(卡扣阈值）', ...  % 50单位向下移动文字位置
    'VerticalAlignment', 'top', ...  % 文字顶端对齐横线下方
    'HorizontalAlignment', 'left', ...
    'Color', 'k','FontSize',13);

% 添加图例和标签
xlabel('time/s');
ylabel('force/N');
title('小车端绳子拉力曲线');
legend('rf', 'rf_x', 'rf_y', 'Location', 'best');
grid on;

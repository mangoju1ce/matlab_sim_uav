% 读取 Excel 文件
filename = 'planespeed.xlsx';  % 替换为你的实际文件名
data = readtable(filename);

% 提取时间和速度模值
t = data.t;
v = data.v;  % 假设这一列是速度大小（单位：m/s）

% 设置飞机质量
m = 20;  % 单位：kg

% 计算动能：Ek = 1/2 * m * v^2
Ek = 0.5 * m * v.^2;

% 绘图：动能随时间变化
figure;
plot(t, Ek, 'Color', [0.1 0.5 0.8], 'LineWidth', 1.8); % 柔和蓝色
xlabel('Time /s');
ylabel('Kinetic Energy /J');
title('固定翼飞机动能曲线');
grid on;


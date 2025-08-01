% 设置模型名称
modelName = 'arithmetic2023';

% 运行模型
out = sim(modelName, 'SaveOutput','on');
disp('仿真完成，正在保存 v_plane 数据...');

% 获取 v_plane 的 timeseries 对象
ts = out.v_plane;

% 提取时间和数据
t = ts.Time;
v = ts.Data;

% 确保 result 文件夹存在
if ~exist('result', 'dir')
    mkdir('result');
end

% 保存为 .mat 文件
save(fullfile('result', 'v_plane.mat'), 't', 'v');

disp('v_plane 数据已保存至 result/v_plane.mat');

% 设置模型名称
modelName = 'arithmetic2023'; 



% 运行模型
out = sim(modelName, 'SaveOutput','on');
disp('仿真完成，正在输出结果')
% 要处理的变量列表
vars = {'r_plane', 'v_plane', 'a_plane', 'r_drone', 'v_drone', 'a_drone', 'T1', 'T_hook','F_drone'}; 

if ~exist('result', 'dir')
    mkdir('result');
end
ts = out.v_plane;

% 提取时间和数据
t = ts.Time;
v = ts.Data;


% 保存为 .mat 文件
save(fullfile('result', 'v_plane.mat'), 't', 'v');

disp('v_plane 数据已保存至 result/v_plane.mat');

for i = 1:length(vars)
    varName = vars{i};
    ts = out.(varName);  % 获取 timeseries 对象

    t = ts.Time;
    y = ts.Data;
   

    % --------- 画 x/y 分量随时间变化图 ---------
    figure('Visible','off');
    plot(t, y(:,1), 'b-', 'DisplayName','x');
    hold on;
    plot(t, y(:,2), 'r--', 'DisplayName','y');
    xlabel('Time (s)', 'Interpreter','none');
    ylabel(varName, 'Interpreter','none');
    legend('Interpreter','none');
    title([varName ' vs Time'], 'Interpreter','none');
    grid on;
    saveas(gcf, fullfile('result', [varName '_t.png']));
    close;

    % --------- 如果是位置向量，画 xy 散点图 ---------
    if strcmp(varName, 'r_plane') || strcmp(varName, 'r_drone')
        figure('Visible','off');
        plot(y(:,1), y(:,2), 'k.-');
        xlabel('x', 'Interpreter','none');
        ylabel('y', 'Interpreter','none');
        title([varName ' trajectory'], 'Interpreter','none');
        axis equal;
        grid on;
        saveas(gcf, fullfile('result', [varName '_xy.png']));
        close;
    end

    % --------- 如果是 T1 或 T_hook，画模长随时间变化图 ---------
    if strcmp(varName, 'T1') || strcmp(varName, 'T_hook') || strcmp(varName,'F_drone')
        magF = sqrt(sum(y.^2, 2));
        figure('Visible','off');
        plot(t, magF, 'm');
        xlabel('Time (s)', 'Interpreter','none');
        ylabel('|F|', 'Interpreter','none');
        title([varName ' Magnitude vs Time'], 'Interpreter','none');
        grid on;
        saveas(gcf, fullfile('result', [varName '_mag_t.png']));
        close;
    end

end

disp('结果已保存')
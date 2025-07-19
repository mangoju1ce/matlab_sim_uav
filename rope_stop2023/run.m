% 运行仿真
simOut = sim('ropestop_cal');
load('f2y.mat')

% 打开数据字典
dictObj = Simulink.data.dictionary.open('data.sldd');
sectionObj = getSection(dictObj, 'Design Data');

% 变量名列表
varNames = {'L', 'k', 'damp'};

% 打印值
fprintf('data.sldd 中各变量值如下：\n');
for i = 1:length(varNames)
    value = getValue(getEntry(sectionObj, varNames{i}));
    fprintf('%s = %.2f\n', varNames{i}, value);
end
fprintf('\n')
% 提取并显示最大值
xmax = max(f2x.Data);
ymax = max(f2y.Data);

disp(['小车所受水平拉力最大值为：', num2str(xmax),'N']);
disp(['小车所受竖直拉力最大值为：', num2str(ymax),'N']);
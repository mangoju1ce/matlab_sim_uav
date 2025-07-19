% 运行仿真
simOut = sim('ropestop_cal');
load('f2y.mat')

% 打开数据字典
dictObj = Simulink.data.dictionary.open('data.sldd');
sectionObj = getSection(dictObj, 'Design Data');

% 变量名列表
varNames = {'L', 'E', 'damp', 'd'};
L = getValue(getEntry(sectionObj, 'L'));
E = getValue(getEntry(sectionObj, 'E'));
damp = getValue(getEntry(sectionObj, 'damp'));
d = getValue(getEntry(sectionObj, 'd'));
k = pi * d * d * E /(4 * L);
% 打印值
fprintf('模型各参数值如下：\n');
fprintf('L = %.2f\n', L);
fprintf('E = %.2f\n', E);
fprintf('damp = %.2f\n', damp);
fprintf('d = %.2f\n', d);
fprintf('k = %.2f\n\n', k);

% 提取并显示最大值
xmax = max(f2x.Data);
ymax = max(f2y.Data);

disp(['小车所受水平拉力最大值为：', num2str(xmax),'N']);
disp(['小车所受竖直拉力最大值为：', num2str(ymax),'N']);
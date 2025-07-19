说明：

1 .运行run.m脚本，会自动运行仿真模型，并把小车受拉力数据保存到matlab工作区（f2x），然后打印最大值。  

2. 仿真文件有两个。ropestop.slx是基于simscape的物理仿真， ropestop_cal.slx负责处理物理量，得到各个受力，运行ropestop_cal后，各个物理量会保存在路径下的mat文件中。具体符号表后附。  

3. 如果需要修改系统的参数，直接在matlab中修改data.sldd，然后重新仿真即可。 

符号表

f1x, f1y 上半绳子拉力  
f2x, f2y 下半绳子拉力  
k 绳子劲度系数  
damp  弹力绳阻尼系数 
m 无人机质量

运行环境：
matlab2023a ， simulink， simscape
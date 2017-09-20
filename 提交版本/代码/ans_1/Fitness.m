%% 适应度值函数     
%输入：
%个体暴露时间
%输出：
%个体的适应度值
function FitnV=Fitness(time)
FitnV=1./time;
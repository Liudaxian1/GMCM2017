%遗传算法求解TSP问题(为选择操作从新设计后程序)
%输入：
%D       距离矩阵
%NIND    为种群个数
%X       参数是中国34个城市的坐标(初始给定)
%MAXGEN  为停止代数，遗传到第MAXGEN代时程序停止,MAXGEN的具体取值视问题的规模和耗费的时间而定
%m       为适值淘汰加速指数,最好取为1,2,3,4,不宜太大
%Pc      交叉概率
%Pm      变异概率
%输出：
%R       为最短路径
%Rlength 为路径长度
clear
clc
close all
%{
%% 加载数据
load CityPosition1.txt
X=CityPosition1;
D=Distanse(X);  %生成距离矩阵
N=size(D,1);    %城市个数
%}
%% 遗传参数
NIND=100;       %种群大小
MAXGEN=2000;     %最大遗传代数
Pc=0.9;         %交叉概率
Pm=0.1;        %变异概率
GGAP=0.9;       %代沟
N=60;
Shortest_Time_A=xlsread('Shortest_Time_A.xls');
Shortest_Time_B=xlsread('Shortest_Time_B.xls');
Shortest_Time_C=xlsread('Shortest_Time_C.xls');
AddNodeNo=[72,74,76,81,82,83]; %增加的节点
%% 初始化种群
Chrom=InitPop(NIND,N);
%Chrom(1,:)=[34	31	38	26	45	7  57	43	40	49	47	1	41	35	11	51	39	33	25	24	3	2	6	30	5	16	14	20	27	21	37	22	32	12	28	54	9	15	36	19	17	4	48	13	23	8	18	10	29	53	60	52	58	44	56	46	42	50	59	55];
%Chrom(2,:)=[41,30,42,24,10,7,20,57,38,11,25,46,50,58,60,33,34,43,44,6,2,47,26,3,23,29,40,52,16,13,8,49,9,12,51,45,56,54,53,35,31,19,55,22,32,27,1,28,15,5,39,36,59,48,21,4,17,18,37,14];
%Chrom(3,:)=[41,30,42,44,10,7,43,57,38,11,25,46,50,58,54,35,34,37,24,6,2,47,1,3,23,29,40,48,20,13,18,59,9,12,51,45,55,60,52,33,31,19,53,36,32,49,27,28,15,5,22,39,26,56,21,4,17,8,16,14];
%{
%% 画出随机解的路径图
DrawPath(Chrom(1,:),X)
pause(0.0001)

%% 输出随机解的路径和总距离
disp('初始种群中的一个随机值:')
OutputPath(Chrom(1,:));
Rlength=PathLength(D,Chrom(1,:));
disp(['总距离：',num2str(Rlength)]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%}
%% 优化
gen=0;
%{
figure;
hold on;box on
xlim([0,MAXGEN])
title('优化过程')
xlabel('代数')
ylabel('最优值')
%}
%ObjV=sumtime(Chrom);  %计算路径长度
[ObjV zhuangzai]=sumtime(Chrom,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
preObjV=min(ObjV);
while gen<MAXGEN
    %% 计算适应度
    %ObjV=sumtime(Chrom);  %计算路径时间
    [ObjV zhuangzai]=sumtime(Chrom,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
    % fprintf('%d   %1.10f\n',gen,min(ObjV))
    line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
    preObjV=min(ObjV);
    FitnV=Fitness(ObjV);
    %% 选择
    SelCh=Select(Chrom,FitnV,GGAP);
    %% 交叉操作
    SelCh=Recombin(SelCh,Pc);
    %% 变异
    SelCh=Mutate(SelCh,Pm);
    %% 逆转操作
    SelCh=Reverse(SelCh,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
    %% 重插入子代的新种群
    Chrom=Reins(Chrom,SelCh,ObjV);
    %% 更新迭代次数
    gen=gen+1 ;
end

%% 画出最优解的路径图
%ObjV=PathLength(D,Chrom);  %计算路径长度
%[minObjV,minInd]=min(ObjV);
%DrawPath(Chrom(minInd(1),:),X)
%% 输出最优解的路径和总距离
%disp('最优解:')
%p=OutputPath(Chrom(minInd(1),:));
%disp(['总距离：',num2str(ObjV(minInd(1)))]);
%disp('-------------------------------------------------------------')


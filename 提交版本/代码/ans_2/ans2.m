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
MAXGEN=1000;     %最大遗传代数
Pc=0.9;         %交叉概率
Pm=0.1;        %变异概率
GGAP=0.9;       %代沟
Add_Zhuangzai=[93,102,104,110,117];
N=60;
  Shortest_Time_A=xlsread('Shortest_Time_A.xls');
  Shortest_Time_B=xlsread('Shortest_Time_B.xls');
  Shortest_Time_C=xlsread('Shortest_Time_C.xls');
for i=1:5
    for j=i:5
        New_1=Add_Zhuangzai(i);
        New_2=Add_Zhuangzai(j);
        zhuangzai=zeros(NIND,24);%记录装载区域
        %% 初始化种群
        %str=(['Var',num2str(i) '= 1', ';']);
        Chrom=InitPop(NIND,N);
        %Chrom(1,:)=[34,31,38,26,45,7,57,43,40,49,47,1,41,35,11,51,39,33,25,24,3,2,6,30,5,16,14,20,27,21,37,22,32,12,28,54,9,15,36,19,17,4,48,13,23,8,18,10,29,53,60,52,58,44,56,46,42,50,59,55];
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
        [ObjV,zhuangzai]=sumtime(Chrom,New_1,New_2,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);  %计算路径时间
        preObjV=min(ObjV);
        while gen<MAXGEN
            %% 计算适应度
            [ObjV,zhuangzai]=sumtime(Chrom,New_1,New_2,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);  %计算路径时间
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
            SelCh=Reverse(SelCh,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
            %% 重插入子代的新种群
            Chrom=Reins(Chrom,SelCh,ObjV);
            %% 更新迭代次数
            gen=gen+1 ;
        end
        %{
        %% 画出最优解的路径图
        ObjV=PathLength(D,Chrom);  %计算路径长度
        [minObjV,minInd]=min(ObjV);
        DrawPath(Chrom(minInd(1),:),X)
        %% 输出最优解的路径和总距离
        disp('最优解:')
        p=OutputPath(Chrom(minInd(1),:));
        disp(['总距离：',num2str(ObjV(minInd(1)))]);
        disp('-------------------------------------------------------------')
        %}
        eval((['Chrom',num2str(i),num2str(j),"=Chrom;"]))

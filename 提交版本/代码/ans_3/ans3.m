%�Ŵ��㷨���TSP����(Ϊѡ�����������ƺ����)
%���룺
%D       �������
%NIND    Ϊ��Ⱥ����
%X       �������й�34�����е�����(��ʼ����)
%MAXGEN  Ϊֹͣ�������Ŵ�����MAXGEN��ʱ����ֹͣ,MAXGEN�ľ���ȡֵ������Ĺ�ģ�ͺķѵ�ʱ�����
%m       Ϊ��ֵ��̭����ָ��,���ȡΪ1,2,3,4,����̫��
%Pc      �������
%Pm      �������
%�����
%R       Ϊ���·��
%Rlength Ϊ·������
clear
clc
close all
%{
%% ��������
load CityPosition1.txt
X=CityPosition1;
D=Distanse(X);  %���ɾ������
N=size(D,1);    %���и���
%}
%% �Ŵ�����
NIND=100;       %��Ⱥ��С
MAXGEN=2000;     %����Ŵ�����
Pc=0.9;         %�������
Pm=0.1;        %�������
GGAP=0.9;       %����
N=60;
Shortest_Time_A=xlsread('Shortest_Time_A.xls');
Shortest_Time_B=xlsread('Shortest_Time_B.xls');
Shortest_Time_C=xlsread('Shortest_Time_C.xls');
AddNodeNo=[72,74,76,81,82,83]; %���ӵĽڵ�
%% ��ʼ����Ⱥ
Chrom=InitPop(NIND,N);
%Chrom(1,:)=[34	31	38	26	45	7  57	43	40	49	47	1	41	35	11	51	39	33	25	24	3	2	6	30	5	16	14	20	27	21	37	22	32	12	28	54	9	15	36	19	17	4	48	13	23	8	18	10	29	53	60	52	58	44	56	46	42	50	59	55];
%Chrom(2,:)=[41,30,42,24,10,7,20,57,38,11,25,46,50,58,60,33,34,43,44,6,2,47,26,3,23,29,40,52,16,13,8,49,9,12,51,45,56,54,53,35,31,19,55,22,32,27,1,28,15,5,39,36,59,48,21,4,17,18,37,14];
%Chrom(3,:)=[41,30,42,44,10,7,43,57,38,11,25,46,50,58,54,35,34,37,24,6,2,47,1,3,23,29,40,48,20,13,18,59,9,12,51,45,55,60,52,33,31,19,53,36,32,49,27,28,15,5,22,39,26,56,21,4,17,8,16,14];
%{
%% ����������·��ͼ
DrawPath(Chrom(1,:),X)
pause(0.0001)

%% ���������·�����ܾ���
disp('��ʼ��Ⱥ�е�һ�����ֵ:')
OutputPath(Chrom(1,:));
Rlength=PathLength(D,Chrom(1,:));
disp(['�ܾ��룺',num2str(Rlength)]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%}
%% �Ż�
gen=0;
%{
figure;
hold on;box on
xlim([0,MAXGEN])
title('�Ż�����')
xlabel('����')
ylabel('����ֵ')
%}
%ObjV=sumtime(Chrom);  %����·������
[ObjV zhuangzai]=sumtime(Chrom,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
preObjV=min(ObjV);
while gen<MAXGEN
    %% ������Ӧ��
    %ObjV=sumtime(Chrom);  %����·��ʱ��
    [ObjV zhuangzai]=sumtime(Chrom,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
    % fprintf('%d   %1.10f\n',gen,min(ObjV))
    line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
    preObjV=min(ObjV);
    FitnV=Fitness(ObjV);
    %% ѡ��
    SelCh=Select(Chrom,FitnV,GGAP);
    %% �������
    SelCh=Recombin(SelCh,Pc);
    %% ����
    SelCh=Mutate(SelCh,Pm);
    %% ��ת����
    SelCh=Reverse(SelCh,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
    %% �ز����Ӵ�������Ⱥ
    Chrom=Reins(Chrom,SelCh,ObjV);
    %% ���µ�������
    gen=gen+1 ;
end

%% �������Ž��·��ͼ
%ObjV=PathLength(D,Chrom);  %����·������
%[minObjV,minInd]=min(ObjV);
%DrawPath(Chrom(minInd(1),:),X)
%% ������Ž��·�����ܾ���
%disp('���Ž�:')
%p=OutputPath(Chrom(minInd(1),:));
%disp(['�ܾ��룺',num2str(ObjV(minInd(1)))]);
%disp('-------------------------------------------------------------')


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
NIND=20;       %��Ⱥ��С
MAXGEN=200;     %����Ŵ�����
Pc=0.9;         %�������
Pm=0.05;        %�������
GGAP=0.9;       %����
N=60;
zhuangzai=zeros(NIND,24);%��¼װ������
%% ��ʼ����Ⱥ
Chrom=InitPop(NIND,N);
Chrom(1,:)=[34,31,38,26,45,7,57,43,40,49,47,1,41,35,11,51,39,33,25,24,3,2,6,30,5,16,14,20,27,21,37,22,32,12,28,54,9,15,36,19,17,4,48,13,23,8,18,10,29,53,60,52,58,44,56,46,42,50,59,55];
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
[ObjV,zhuangzai]=sumtime(Chrom,110,117);  %����·��ʱ��
preObjV=min(ObjV);
while gen<MAXGEN
    %% ������Ӧ��
    [ObjV,zhuangzai]=sumtime(Chrom,110,117);  %����·��ʱ��
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
    SelCh=Reverse(SelCh);
    %% �ز����Ӵ�������Ⱥ
    Chrom=Reins(Chrom,SelCh,ObjV);
    %% ���µ�������
    gen=gen+1 ;
end
%{
%% �������Ž��·��ͼ
ObjV=PathLength(D,Chrom);  %����·������
[minObjV,minInd]=min(ObjV);
DrawPath(Chrom(minInd(1),:),X)
%% ������Ž��·�����ܾ���
disp('���Ž�:')
p=OutputPath(Chrom(minInd(1),:));
disp(['�ܾ��룺',num2str(ObjV(minInd(1)))]);
disp('-------------------------------------------------------------')
%}

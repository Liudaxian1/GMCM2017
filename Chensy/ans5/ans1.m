loc=zeros(24,300);%ÿ����·��
tim=zeros(24,300);%ÿ�����ڵ�ʱ��
Shortest_Time_A=xlsread('E:\��ѧ��ģ����\2017����\owncloud\����һ\�Ŵ��㷨\Shortest_Time_A.xls');
Shortest_Time_B=xlsread('E:\��ѧ��ģ����\2017����\owncloud\����һ\�Ŵ��㷨\Shortest_Time_B.xls');
Shortest_Time_C=xlsread('E:\��ѧ��ģ����\2017����\owncloud\����һ\�Ŵ��㷨\Shortest_Time_C.xls');
link_one=xlsread('E:\��ѧ��ģ����\2017����\owncloud\����һ\·���滮\link_one.xls');
link_two=xlsread('E:\��ѧ��ģ����\2017����\owncloud\����һ\·���滮\link_two.xls');
load Cost.mat;
zpoint=[4,6,6,1,1,6,3,5,5,6,1,1,5,6,4,1,6,4,1,1,4,6,6,4]';%װ��λ��
fpoint=[34,23,32,26,45,7,57,43,40,36,47,48,41,11,35,51,39,33,25,24,3,2,6,30,5,16,14,44,27,18,37,22,38,12,28,54,42,15,49,46,17,4,53,60,31,9,8,10]';%�����
pri=priority( fpoint,zpoint);%�������ȼ�(24*1����)
car=(find(pri==1));
car_id=floor(car/3);
switch car_id
    case 1
        C=Shortest_Path_Print(CostA,1,fpoint(car,1)+8);
        loc(car,1:length(C))=C;
        j=2;
        while loc(car,j)
            time(car,j)=Shortest_Time_A(loc(car,j-1),loc(car,j));
            j=j+1;
        end
    case 2
        C=Shortest_Path_Print(CostA,2,fpoint(car,1)+8);
        loc(car,1:length(C))=C;      
        j=2;
        while loc(car,j)
            time(car,j)=Shortest_Time_A(loc(car,j-1),loc(car,j));
            j=j+1;
        end
    case 3
        C=Shortest_Path_Print(CostB,1,fpoint(car,1)+8);
        loc(car,1:length(C))=C;
        j=2;
        while loc(car,j)
            time(car,j)=Shortest_Time_B(loc(car,j-1),loc(car,j));
            j=j+1;
        end
    case 4
        C=Shortest_Path_Print(CostB,2,fpoint(car,1)+8);
        loc(car,1:length(C))=C;
        j=2;
        while loc(car,j)
            time(car,j)=Shortest_Time_B(loc(car,j-1),loc(car,j));
            j=j+1;
        end
    case 5
        C=Shortest_Path_Print(CostC,1,fpoint(car,1)+8);
        loc(car,1:length(C))=C;
        j=2;
        while loc(car,j)
            time(car,j)=Shortest_Time_C(loc(car,j-1),loc(car,j));
            j=j+1;
        end
    case 6
        C=Shortest_Path_Print(CostC,1,fpoint(car,1)+8);
        loc(car,1:length(C))=C;
        j=2;
        while loc(car,j)
            time(car,j)=Shortest_Time_C(loc(car,j-1),loc(car,j));
            j=j+1;
        end
    case 7
        C=Shortest_Path_Print(CostC,2,fpoint(car,1)+8);
        loc(car,1:length(C))=C;
        j=2;
        while loc(car,j)
            time(car,j)=Shortest_Time_C(loc(car,j-1),loc(car,j));
            j=j+1;
        end
    case 8
        C=Shortest_Path_Print(CostC,2,fpoint(car,1)+8);
        loc(car,1:length(C))=C;
        j=2;
        while loc(car,j)
            time(car,j)=Shortest_Time_C(loc(car,j-1),loc(car,j));
            j=j+1;
        end
end

for i=2:24 %�����ȼ��滮�г�·��
    car=(find(pri==1));
    
    
end
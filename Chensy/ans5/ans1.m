loc=zeros(24,300);%每辆车路线
tim=zeros(24,300);%每辆车节点时刻
Shortest_Time_A=xlsread('E:\数学建模资料\2017研赛\owncloud\陈守一\遗传算法\Shortest_Time_A.xls');
Shortest_Time_B=xlsread('E:\数学建模资料\2017研赛\owncloud\陈守一\遗传算法\Shortest_Time_B.xls');
Shortest_Time_C=xlsread('E:\数学建模资料\2017研赛\owncloud\陈守一\遗传算法\Shortest_Time_C.xls');
link_one=xlsread('E:\数学建模资料\2017研赛\owncloud\陈守一\路径规划\link_one.xls');
link_two=xlsread('E:\数学建模资料\2017研赛\owncloud\陈守一\路径规划\link_two.xls');
load Cost.mat;
zpoint=[4,6,6,1,1,6,3,5,5,6,1,1,5,6,4,1,6,4,1,1,4,6,6,4]';%装载位置
fpoint=[34,23,32,26,45,7,57,43,40,36,47,48,41,11,35,51,39,33,25,24,3,2,6,30,5,16,14,44,27,18,37,22,38,12,28,54,42,15,49,46,17,4,53,60,31,9,8,10]';%发射点
pri=priority( fpoint,zpoint);%计算优先级(24*1矩阵)
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

for i=2:24 %依优先级规划行车路线
    car=(find(pri==1));
    
    
end
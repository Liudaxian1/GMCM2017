loc=zeros(24,300);%每辆车路线
tim=zeros(24,300);%每辆车节点时刻
Shortest_Time_A=xlsread('Shortest_Time_A.xls');
Shortest_Time_B=xlsread('Shortest_Time_B.xls');
Shortest_Time_C=xlsread('Shortest_Time_C.xls');
Time_dyn=zeros(1,300);
Path_dyn=zeros(1,300);
Time=zeros(1,300);
Path=zeros(1,300);
link_dynamic=zeros(130,130);
load Cost.mat;
CostA_dyn=CostA;
CostB_dyn=CostB;
CostC_dyn=CostC;
zpoint=[6,4,5,4,6,6,5,3,4,6,1,2,6,6,6,6,2,5,1,1,6,1,1,6]';%装载位置
fpoint=[11,34,42,28,6,4,43,58,35,3,44,26,37,36,39,38,54,41,46,47,1,25,24,2,19,33,23,31,9,13,20,57,32,8,49,29,7,18,22,21,30,40,45,48,10,51,50,12]';%发射点
pri=priority_1( fpoint,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);%计算优先级(24*1矩阵)
car=(find(pri==1));
[loc(car,:), tim(car,:)]=location(car, fpoint,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
for i=2:24 %依优先级规划行车路线    
    car=(find(pri==i))
    [loc(car,:), tim(car,:)]=location(car, fpoint,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
    for flag=1:299
        if (tim(car,flag)==0)&&(flag>1)
            flag=flag-1;
            break
        end    
    end
    tim(car,1:flag)=max(tim(find(pri==1),:))-max(tim(car,:))+tim(car,1:flag);
    t_adjust=tim(car,1);
    j=1;
    while loc(car,j)~=(fpoint(car,1)+8)
        CostA_dyn=CostA;
        CostB_dyn=CostB;
        CostC_dyn=CostC;
        link_dynamic=link_dyn(i,pri, tim(car,j),loc,tim);%此时动态连通矩阵         
        CostA_dyn(find(link_dynamic==0))=inf;
        CostB_dyn(find(link_dynamic==0))=inf;
        CostC_dyn(find(link_dynamic==0))=inf;
        if car>=13
            [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostC_dyn,loc(car,j),fpoint(car,1)+8);
            [Time,Path]=Shortest_Path_Print_All(CostC,loc(car,j),fpoint(car,1)+8);
        else
            if car>=7
                [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostB_dyn,loc(car,j),fpoint(car,1)+8);
                [Time,Path]=Shortest_Path_Print_All(CostB,loc(car,j),fpoint(car,1)+8);
            else                
                [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostA_dyn,loc(car,j),fpoint(car,1)+8);
                [Time,Path]=Shortest_Path_Print_All(CostA,loc(car,j),fpoint(car,1)+8);
            end
        end
%        if Path_dyn(1,2)~=Path(1,2)
%            if t_adjust>=(Time_dyn(1,2)-Time(1,2))
%                t_adjust=Time(1,2)-Time_dyn(1,2)+t_adjust;
%                j=1;
%                tim(car,1)=t_adjust;
%            else
%            loc(car,j+1)=Path_dyn(1,2);
%            tim(car,j+1)=tim(car,j)+Time_dyn(1,2);
%            j=j+1;
%            end
%        else
if size(Path_dyn)==0
    loc(car,j+1)=Path(1,2);
            tim(car,j+1)=tim(car,j)+Time(1,2);
            j=j+1;
else
    if (Path_dyn(1,2)~=Path(1,2))&&(t_adjust>1/12)
                t_adjust=t_adjust-1/12;
                j=1;
                tim(car,1)=t_adjust;
    else
            loc(car,j+1)=Path_dyn(1,2);
            tim(car,j+1)=tim(car,j)+Time_dyn(1,2);
            j=j+1;
    end
end
    end
    

end
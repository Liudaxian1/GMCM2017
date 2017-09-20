loc=zeros(24,300);%每辆车路线
tim=zeros(24,300);%每辆车节点时刻
loc_2=zeros(24,300);%每辆车路线
tim_2=zeros(24,300);%每辆车节点时刻
loc_3=zeros(24,300);%每辆车路线
tim_3=zeros(24,300);%每辆车节点时刻
size_2=zeros(24,1);
size_3=zeros(24,1);
Time_dyn=zeros(1,300);
Path_dyn=zeros(1,300);
Time=zeros(1,300);
Path=zeros(1,300);
link_dynamic=zeros(130,130);
Shortest_Time_A=xlsread('Shortest_Time_A.xls');
Shortest_Time_B=xlsread('Shortest_Time_B.xls');
Shortest_Time_C=xlsread('Shortest_Time_C.xls');
load Cost.mat;
CostA_dyn=CostA;
CostB_dyn=CostB;
CostC_dyn=CostC;
zpoint=[6,4,5,4,6,6,5,3,4,6,1,2,6,6,6,6,2,5,1,1,6,1,1,6]';%装载位置
fpoint=[11,34,42,28,6,4,43,58,35,3,44,26,37,36,39,38,54,41,46,47,1,25,24,2,19,33,23,31,9,13,20,57,32,8,49,29,7,18,22,21,30,40,45,48,10,51,50,12]';%发射点
pri=priority_2( fpoint,zpoint,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);%计算优先级(24*1矩阵)

car=(find(pri==1))
if car>=13
    [A,B]=Shortest_Path_Print_All(CostC,fpoint(car,1)+8,zpoint(car,1)+2);
    [C,D]=Shortest_Path_Print_All(CostC,zpoint(car,1)+2,fpoint(car+24,1)+8);
    [r,size_2(car,1)]=size(A);
    [r,size_3(car,1)]=size(C);
    tim_2(car,1:size_2(car,1))=A;
    loc_2(car,1:size_2(car,1))=B;
    tim_3(car,1:size_3(car,1))=C;
    loc_3(car,1:size_3(car,1))=D;

else
    if car>=7
    [A,B]=Shortest_Path_Print_All(CostB,fpoint(car,1)+8,zpoint(car,1)+2);
    [C,D]=Shortest_Path_Print_All(CostB,zpoint(car,1)+2,fpoint(car+24,1)+8);
    [r,size_2(car,1)]=size(A);
    [r,size_3(car,1)]=size(C);
    tim_2(car,1:size_2(car,1))=A;
    loc_2(car,1:size_2(car,1))=B;
    tim_3(car,1:size_3(car,1))=C;
    loc_3(car,1:size_3(car,1))=D; 
    else
        [A,B]=Shortest_Path_Print_All(CostA,fpoint(car,1)+8,zpoint(car,1)+2);
        [C,D]=Shortest_Path_Print_All(CostA,zpoint(car,1)+2,fpoint(car+24,1)+8);
        [r,size_2(car,1)]=size(A);
        [r,size_3(car,1)]=size(C);
        tim_2(car,1:size_2(car,1))=A;
        loc_2(car,1:size_2(car,1))=B;
        tim_3(car,1:size_3(car,1))=C;
        loc_3(car,1:size_3(car,1))=D;
    end
end
    t_start=max(tim_2(car,:));
    tim_3(car,1:size_3(car,1))=tim_3(car,1:size_3(car,1))+1/6+t_start;
loc(car,1:size_2(car,1)+size_3(car,1))=[loc_2(car,1:size_2(car,1)),loc_3(car,1:size_3(car,1))];
tim(car,1:size_2(car,1)+size_3(car,1))=[tim_2(car,1:size_2(car,1)),tim_3(car,1:size_3(car,1))];

for i=2:24 %依优先级规划行车路线    
    car=(find(pri==i))
if car>=13
    [A,B]=Shortest_Path_Print_All(CostC,fpoint(car,1)+8,zpoint(car,1)+2);
    [C,D]=Shortest_Path_Print_All(CostC,zpoint(car,1)+2,fpoint(car+24,1)+8);
    [r,size_2(car,1)]=size(A);
    [r,size_3(car,1)]=size(C);
    tim_2(car,1:size_2(car,1))=A;
    loc_2(car,1:size_2(car,1))=B;
    tim_3(car,1:size_3(car,1))=C;
    loc_3(car,1:size_3(car,1))=D;

else
    if car>=7
    [A,B]=Shortest_Path_Print_All(CostB,fpoint(car,1)+8,zpoint(car,1)+2);
    [C,D]=Shortest_Path_Print_All(CostB,zpoint(car,1)+2,fpoint(car+24,1)+8);
    [r,size_2(car,1)]=size(A);
    [r,size_3(car,1)]=size(C);
    tim_2(car,1:size_2(car,1))=A;
    loc_2(car,1:size_2(car,1))=B;
    tim_3(car,1:size_3(car,1))=C;
    loc_3(car,1:size_3(car,1))=D; 
    else
        [A,B]=Shortest_Path_Print_All(CostA,fpoint(car,1)+8,zpoint(car,1)+2);
        [C,D]=Shortest_Path_Print_All(CostA,zpoint(car,1)+2,fpoint(car+24,1)+8);
        [r,size_2(car,1)]=size(A);
        [r,size_3(car,1)]=size(C);
        tim_2(car,1:size_2(car,1))=A;
        loc_2(car,1:size_2(car,1))=B;
        tim_3(car,1:size_3(car,1))=C;
        loc_3(car,1:size_3(car,1))=D;
    end
end
%t_start=max(tim_2(car,:));
%tim_3(car,:)=tim_3(car,:)+1/6+t_start;
%loc(car,1:size_2(car,1)+size_3(car,1))=[loc_2(car,1:size_2(car,1)),loc_3(car,1:size_3(car,1))];
%tim(car,1:size_2(car,1)+size_3(car,1))=[tim_2(car,1:size_2(car,1)),tim_3(car,1:size_3(car,1))];

    j=1;
    
    while loc_2(car,j)~=(zpoint(car,1)+2)
        CostA_dyn=CostA;
        CostB_dyn=CostB;
        CostC_dyn=CostC;
        link_dynamic=link_dyn(i,pri, tim_2(car,j),loc,tim);%此时动态连通矩阵         
        CostA_dyn(find(link_dynamic==0))=inf;
        CostB_dyn(find(link_dynamic==0))=inf;
        CostC_dyn(find(link_dynamic==0))=inf;
        if car>=13
            [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostC_dyn,loc_2(car,j),zpoint(car,1)+2);
            [Time,Path]=Shortest_Path_Print_All(CostC,loc_2(car,j),fpoint(car,1)+8);
        else
            if car>=7
                [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostB_dyn,loc_2(car,j),zpoint(car,1)+2);
                [Time,Path]=Shortest_Path_Print_All(CostC,loc_2(car,j),fpoint(car,1)+8);
            else                
                [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostA_dyn,loc_2(car,j),zpoint(car,1)+2);
                [Time,Path]=Shortest_Path_Print_All(CostC,loc_2(car,j),fpoint(car,1)+8);
            end
        end
            num_z=number_z(i,zpoint(car,1), tim_2(car,j),loc,tim,pri); %判断装载区域实时车辆
            delta_t=0;
            if size(Path_dyn)==0
                loc_2(car,j+1)=Path(1,2);
                tim_2(car,j+1)=tim_2(car,j)+Time(1,2);
                j=j+1;
            else
            loc_2(car,j+1)=Path_dyn(1,2);
            tim_2(car,j+1)=tim_2(car,j)+Time_dyn(1,2);
            j=j+1;
            end
            [row,line]=size(Path_dyn);
            while (num_z)>=2&& (line==2)
                tim_2(car,j)=tim_2(car,j)+1/60;
                num_z=number_z(i,zpoint(car,1), tim_2(car,j),loc,tim,pri);
            end             
    end  
    t_start=max(tim_2(car,:));
    for flag_2=1:299
        if (tim_2(car,flag_2)==0)&&(flag_2>1)
            flag_2=flag_2-1;
            break
        end
    end
    for flag_3=1:299
        if (tim_3(car,flag_3)==0)&&(flag_3>1)
            flag_3=flag_3-1;
            break
        end
    end
    tim_3(car,1:flag_3)=tim_3(car,1:flag_3)+1/6+t_start;
    t_adjust=max(max(tim_3(find(pri==1),:))-max(tim_3(car,:)),0);
    tim_3(car,1:flag_3)=t_adjust+tim_3(car,1:flag_3);
    loc(car,1:flag_2+flag_3)=[loc_2(car,1:flag_2),loc_3(car,1:flag_3)];
    tim(car,1:flag_2+flag_3)=[tim_2(car,1:flag_2),tim_3(car,1:flag_3)];

    j=1;
    
        while loc_3(car,j)~=(fpoint(car+24,1)+8)
        CostA_dyn=CostA;
        CostB_dyn=CostB;
        CostC_dyn=CostC;
        link_dynamic=link_dyn(i,pri, tim_3(car,j),loc,tim);%此时动态连通矩阵         
        CostA_dyn(find(link_dynamic==0))=inf;
        CostB_dyn(find(link_dynamic==0))=inf;
        CostC_dyn(find(link_dynamic==0))=inf;
        if car>=13
            [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostC_dyn,loc_3(car,j),fpoint(car+24,1)+8);
            [Time,Path]=Shortest_Path_Print_All(CostC,loc_3(car,j),fpoint(car+24,1)+8);
        else
            if car>=7
                [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostB_dyn,loc_3(car,j),fpoint(car+24,1)+8);
                [Time,Path]=Shortest_Path_Print_All(CostB,loc_3(car,j),fpoint(car+24,1)+8);
            else                
                [Time_dyn,Path_dyn]=Shortest_Path_Print_All(CostA_dyn,loc_3(car,j),fpoint(car+24,1)+8);
                [Time,Path]=Shortest_Path_Print_All(CostA,loc_3(car,j),fpoint(car+24,1)+8);
            end
        end
if size(Path_dyn)==0
    loc_3(car,j+1)=Path(1,2);
            tim_3(car,j+1)=tim_3(car,j)+Time(1,2);
            j=j+1;
else
    if (Path_dyn(1,2)~=Path(1,2))&&(t_adjust>1/12)
                t_adjust=t_adjust-1/12;
                j=1;
                tim_3(car,1)=tim_3(car,1)-1/12;
    else
            loc_3(car,j+1)=Path_dyn(1,2);
            tim_3(car,j+1)=tim_3(car,j)+Time_dyn(1,2);
            j=j+1;
    end
end
        end
        for flag_3=1:299
        if (tim_3(car,flag_3)==0)&&(flag_3>1)
            flag_3=flag_3-1;
            break
        end
        end
    loc(car,1:flag_2+flag_3)=[loc_2(car,1:flag_2),loc_3(car,1:flag_3)];
    tim(car,1:flag_2+flag_3)=[tim_2(car,1:flag_2),tim_3(car,1:flag_3)];               

end
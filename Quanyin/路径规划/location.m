function [loc tim]= location( car, fpoint,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
loc=zeros(1,300);%每辆车路线
tim=zeros(1,300);%每辆车节点时刻
%re_loc=zeros(1,300);%车路线倒转
%re_tim=zeros(1,300);%车节点时刻倒转
load Cost.mat;
car_id=ceil(car/3);
switch car_id
    case 1
        C=Shortest_Path_Print(CostA,1,fpoint(car,1)+8);
        loc(1,1:length(C))=C;
        j=2;
        while loc(1,j)
            tim(1,j)=tim(1,j-1)+Shortest_Time_A(loc(1,j-1),loc(1,j));
            j=j+1;
        end
    case 2
        C=Shortest_Path_Print(CostA,2,fpoint(car,1)+8);
        loc(1,1:length(C))=C;      
        j=2;
        while loc(1,j)
            tim(1,j)=tim(1,j-1)+Shortest_Time_A(loc(1,j-1),loc(1,j));
            j=j+1;
        end
    case 3
        C=Shortest_Path_Print(CostB,1,fpoint(car,1)+8);
        loc(1,1:length(C))=C;
        j=2;
        while loc(1,j)
            tim(1,j)=tim(1,j-1)+Shortest_Time_B(loc(1,j-1),loc(1,j));
            j=j+1;
        end
    case 4
        C=Shortest_Path_Print(CostB,2,fpoint(car,1)+8);
        loc(1,1:length(C))=C;
        j=2;
        while loc(1,j)
            tim(1,j)=tim(1,j-1)+Shortest_Time_B(loc(1,j-1),loc(1,j));
            j=j+1;
        end
    case 5
        C=Shortest_Path_Print(CostC,1,fpoint(car,1)+8);
        loc(1,1:length(C))=C;
        j=2;
        while loc(1,j)
            tim(1,j)=tim(1,j-1)+Shortest_Time_C(loc(1,j-1),loc(1,j));
            j=j+1;
        end
    case 6
        C=Shortest_Path_Print(CostC,1,fpoint(car,1)+8);
        loc(1,1:length(C))=C;
        j=2;
        while loc(1,j)
            tim(1,j)=tim(1,j-1)+Shortest_Time_C(loc(1,j-1),loc(1,j));
            j=j+1;
        end
    case 7
        C=Shortest_Path_Print(CostC,2,fpoint(car,1)+8);
        loc(1,1:length(C))=C;
        j=2;
        while loc(1,j)
            tim(1,j)=tim(1,j-1)+Shortest_Time_C(loc(1,j-1),loc(1,j));
            j=j+1;
        end
    case 8
        C=Shortest_Path_Print(CostC,2,fpoint(car,1)+8);
        loc(1,1:length(C))=C;
        j=2;
        while loc(1,j)
            tim(1,j)=tim(1,j-1)+Shortest_Time_C(loc(1,j-1),loc(1,j));
            j=j+1;
        end
end
%{
flag=find(tim==max(tim));
for i=1:flag
    re_loc(1,i)=loc(1,1+flag-i);%车路线倒转
    re_tim(1,i)=tim(1,1+flag-i);%车节点时刻倒转
end
loc=re_loc;%每辆车路线
tim=re_tim;%每辆车节点时刻
%}
end


function Path_Out = Shortest_Path_Print(Cost,StartPointNo,EndPointNo,CrossPointNo)
%%% 输出最短路径,Cost为权重,StartPointNo为起点，EndPointNo为终点,CrossPointNo为总的节点数
    if nargin==3
        CrossPointNo=130;  
    end
    [Min_Distance Path]=ShortestPath_Djk(Cost,CrossPointNo,StartPointNo);%调用djk计算最短路径
    i=EndPointNo;
    count=1;
    Path_Out(count)=i;
    count=count+1;
    if (Path(i)==StartPointNo) & (Min_Distance(i)<Inf)
        Path_Out(count)=i;
        count=count+1;
    elseif  (Min_Distance(i)==Inf)
    else 
        while(Path(i)~=StartPointNo)
        Path_Out(count)=Path(i);
        count=count+1;
        i=Path(i);
        end
        Path_Out(count)=StartPointNo;
    end
    Path_Out=fliplr(Path_Out);%%改为起点到终点
end


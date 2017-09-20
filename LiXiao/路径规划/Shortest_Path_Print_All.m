function [Time_Out,Path_Out] = Shortest_Path_Print_All(Cost,StartPointNo,EndPointNo,CrossPointNo)
    if nargin==3
        CrossPointNo=130;
    end
    [Min_Distance,Path]=ShortestPath_Djk(Cost,CrossPointNo,StartPointNo);
    i=EndPointNo;
    count=1;
    Path_Out(count)=i;
    %Time_Out(count)=0;
    count=count+1;
    if (Path(i)==StartPointNo) && (Min_Distance(i)<Inf)
        Path_Out(count)=StartPointNo;
        %Time_Out(count)=Cost(i,i);
        count=count+1;
    elseif  (Min_Distance(i)==Inf)
    else 
        while(Path(i)~=StartPointNo)
        Path_Out(count)=Path(i);
        %Time_Out(count)=Cost(i,Path(i));
        count=count+1;
        i=Path(i);
        end
        Path_Out(count)=StartPointNo;
    end
    Path_Out=fliplr(Path_Out); %ÐÐÏòÁ¿
    Time_Out=zeros(1,size(Path_Out,2));
    
    for j=fliplr(2:size(Path_Out,2))        
       Time_Out(j)=Cost(Path_Out(j),Path_Out(j-1));
    end
    for j=fliplr(2:size(Path_Out,2))         
        Time_Out(j)=sum(Time_Out(1:j));
    end
end


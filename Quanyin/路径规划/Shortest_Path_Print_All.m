function [Time_Out,Path_Out] = Shortest_Path_Print_All(Cost,StartPointNo,EndPointNo,CrossPointNo)
%%% updated
    if nargin==3
        CrossPointNo=130;
    end
    [Min_Distance,Path_Out]=ShortestPath_Djk_Point_to_Point(Cost,StartPointNo,EndPointNo,CrossPointNo);
    Time_Out=zeros(1,size(Path_Out,2));
    
    for j=fliplr(2:size(Path_Out,2))        
        Time_Out(j)=Cost(Path_Out(j-1),Path_Out(j));
    end
    for j=fliplr(2:size(Path_Out,2))         
        Time_Out(j)=sum(Time_Out(1:j));
    end
end

function [distance,path]=ShortestPath_Djk_Point_to_Point(Cost,StartPointNo,EndPointNo,CrossPointNo)
% returns the distance and path between the start node and the end node.
    if nargin==3
        n=CrossPointNo;
    else
        n=size(Cost,1);         % node number
    end
    if StartPointNo==EndPointNo
        distance=0;
        path=[StartPointNo,EndPointNo];
        return;
    end
     if Cost(StartPointNo,EndPointNo)<Inf
        distance=Cost(StartPointNo,EndPointNo);
        path=[StartPointNo,EndPointNo];
        return;
     end

    D=Cost(StartPointNo,:);	% distance vector
    path=[];                % path vector
    visit=ones(1,n);        % node visibility
    visit(StartPointNo)=1; 	% source node is unvisible
    parent=zeros(1,n);  % parent node
    % the shortest distance
    for i=1:n-1         % BlueSet has n-1 nodes
        temp=zeros(1,n);
        count=0;
        for j=1:n
            if visit(j)
                temp=[temp(1:count) D(j)];
            else
                temp=[temp(1:count) inf];
            end
            count=count+1;
        end
        [value,index]=min(temp);
        j=index; visit(j)=0;
        for k=1:n
            if D(k)>D(j)+Cost(j,k)
                D(k)=D(j)+Cost(j,k);
                parent(k)=j;
            end
        end
    end
    distance=D(EndPointNo);
    % the shortest distance path
    if parent(EndPointNo)==0
        return;
    end
    path=zeros(1,2*n);      % path preallocation
    t=EndPointNo; path(1)=t; count=1;
    while t~=StartPointNo && t>0
        p=parent(t);
        path=[p path(1:count)];
        t=p;
        count=count+1;
    end
    if count>=2*n
        error(['The path preallocation length is too short.',...
            'Please redefine path preallocation parameter.']);
    end
    path(1)=StartPointNo;
    path=path(1:count);
end
%%% NetWork Weight 某一节点删除计算平均最短路径(一些特殊的的计算）
%%%移除83后，再移除6号时会形成F31,F32,F33,J37孤岛
Ave_ST_temp_A=Ave_ST(CostA,CrossPointNo);
Ave_ST_temp_B=Ave_ST(CostB,CrossPointNo);
Ave_ST_temp_C=Ave_ST(CostC,CrossPointNo);
%Ave_ST_temp_6=Ave_ST_temp_A6*0.25+Ave_ST_temp_B6*0.25+Ave_ST_temp_C6*0.5;
function Ave_ST_OUT=Ave_ST(Cost,CrossPointNo) %% 移除某个节点之后,计算平均最短路径
    Ave_ST_OUT=zeros(CrossPointNo,2);
    %for i=1:CrossPointNo
    i=91;
        Cost_temp=Cost;
        Cost_temp(105,:)=[];Cost_temp(:,105)=[];CrossPointNo=CrossPointNo-1;   %%删除节点105
        Cost_temp(i,:)=[];Cost_temp(:,i)=[];       %%删除节点i
        Cost_temp(90,:)=[];Cost_temp(:,90)=[];CrossPointNo=CrossPointNo-1;     %%删除节点90 
        Cost_temp(89,:)=[];Cost_temp(:,89)=[];CrossPointNo=CrossPointNo-1;     %%删除节点89 
        Cost_temp(83,:)=[];Cost_temp(:,83)=[];CrossPointNo=CrossPointNo-1;     %%删除节点83
        Cost_temp(41,:)=[];Cost_temp(:,41)=[];CrossPointNo=CrossPointNo-1;     %%删除节点41
        Cost_temp(40,:)=[];Cost_temp(:,40)=[];CrossPointNo=CrossPointNo-1;
        Cost_temp(39,:)=[];Cost_temp(:,39)=[];CrossPointNo=CrossPointNo-1;     %%删除节点39
        Cost_temp(14,:)=[];Cost_temp(:,14)=[];CrossPointNo=CrossPointNo-1;     %%删除节点90 
        Cost_temp(13,:)=[];Cost_temp(:,13)=[];CrossPointNo=CrossPointNo-1;     %%删除节点89 
        Cost_temp(12,:)=[];Cost_temp(:,12)=[];CrossPointNo=CrossPointNo-1;     %%删除节点83    
        isolated=0;

        for j=fliplr(1:(CrossPointNo-1))   %% 判断孤立点,并移除
            A=Cost_temp(j,1:j-1)>100;
            B=Cost_temp(j,j+1:CrossPointNo-isolated-1)>100;
            if size(A,2)==0
                A=1;
            end
            if size(B,2)==0
                B=1;
            end
            if mean(A(:))==1 && mean(B(:))==1
                Cost_temp(:,j)=[];
                Cost_temp(j,:)=[];
                isolated=isolated+1;
            end
        end                
        ST_temp=Out_ST(Cost_temp,CrossPointNo-isolated-1);
        Ave_ST_OUT(i,1)=mean(ST_temp(:)); %%计算平均最短时间
        Ave_ST_OUT(i,2)=isolated;         %% 移除节点i后，孤立点数目
    %end
end



function Muti_Cost_Time=Out_ST(Cost,CrossPointNo)
    Muti_Cost_Time=zeros(CrossPointNo,CrossPointNo);
    for i=1:CrossPointNo
        [Min_Distance Path]=ShortestPath_Djk(Cost,CrossPointNo,i);
        Muti_Cost_Time(i,:)=Min_Distance;
    end
end
%%% NetWork Weight 移除一个节点后，再次移除,节点删除计算平均最短路径
Ave_ST_A_3=Ave_ST(CostA,CrossPointNo-2);
Ave_ST_B_3=Ave_ST(CostB,CrossPointNo-2);
Ave_ST_C_3=Ave_ST(CostC,CrossPointNo-2);
Ave_ST_A_3(6,1)=3.096557331026836; %%修正异常点,由node_Weight计算给出
Ave_ST_B_3(6,1)=3.189486866274298;
Ave_ST_C_3(6,1)=3.297301023211854;
Ave_ST_A_3(89,1)=2.940833233722060;
Ave_ST_B_3(89,1)=3.034779555079168;
Ave_ST_C_3(89,1)=3.143740539333479;
Ave_ST_All_3=Ave_ST_A_3*0.25+Ave_ST_B_3*0.25+Ave_ST_C_3*0.5;
save("Ave_ST_3.mat","Ave_ST_All_3","Ave_ST_A_3","Ave_ST_B_3","Ave_ST_C_3");

function Ave_ST_OUT=Ave_ST(Cost,CrossPointNo) %% 移除某个节点之后,计算平均最短路径
    Ave_ST_OUT=zeros(CrossPointNo,2);
    for i=1:CrossPointNo
        Cost_temp=Cost;
        Cost_temp(89,:)=[];Cost_temp(:,89)=[]; %%删除第二个节点89  
        Cost_temp(83,:)=[];Cost_temp(:,83)=[]; %%删除第一个节点83        
        Cost_temp(i,:)=[];Cost_temp(:,i)=[];    %%删除节点i
        
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
    end
end

function Muti_Cost_Time=Out_ST(Cost,CrossPointNo)
    Muti_Cost_Time=zeros(CrossPointNo,CrossPointNo);
    for i=1:CrossPointNo
        [Min_Distance Path]=ShortestPath_Djk(Cost,CrossPointNo,i);
        Muti_Cost_Time(i,:)=Min_Distance;
    end
end
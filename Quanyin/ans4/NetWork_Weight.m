%%% NetWork Weight �ڵ�ɾ������ƽ�����·��
Ave_ST_A_1=Ave_ST(CostA,CrossPointNo);
Ave_ST_B_1=Ave_ST(CostB,CrossPointNo);
Ave_ST_C_1=Ave_ST(CostC,CrossPointNo);
Ave_ST_All_1=Ave_ST_A_1*0.25+Ave_ST_B_1*0.25+Ave_ST_C_1*0.5;
%xlswrite("Ave_ST_A.xls", Ave_ST_A);
%xlswrite("Ave_ST_B.xls", Ave_ST_B);
%xlswrite("Ave_ST_C.xls", Ave_ST_C);
save("Ave_ST_1.mat","Ave_ST_All_1","Ave_ST_A_1","Ave_ST_B_1","Ave_ST_C_1");
function Ave_ST_OUT=Ave_ST(Cost,CrossPointNo) %% �Ƴ�ĳ���ڵ�֮��,����ƽ�����·��
    Ave_ST_OUT=zeros(CrossPointNo,2);
    for i=1:CrossPointNo
        Cost_temp=Cost;
        Cost_temp(i,:)=[];   %%ɾ���ڵ�i
        Cost_temp(:,i)=[];
        isolated=0;

        for j=fliplr(1:(CrossPointNo-1))   %% �жϹ�����,���Ƴ�
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
        Ave_ST_OUT(i,1)=mean(ST_temp(:)); %%����ƽ�����ʱ��
        Ave_ST_OUT(i,2)=isolated;         %% �Ƴ��ڵ�i�󣬹�������Ŀ
    end
end

function Muti_Cost_Time=Out_ST(Cost,CrossPointNo)
    Muti_Cost_Time=zeros(CrossPointNo,CrossPointNo);
    for i=1:CrossPointNo
        [Min_Distance Path]=ShortestPath_Djk(Cost,CrossPointNo,i);
        Muti_Cost_Time(i,:)=Min_Distance;
    end
end
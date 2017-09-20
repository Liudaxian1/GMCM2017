%%% NetWork Weight �Ƴ�һ���ڵ���ٴ��Ƴ�,�ڵ�ɾ������ƽ�����·��
load Cost.mat
load('Paraments.mat');
Ave_ST_A_2=Ave_ST(CostA,CrossPointNo-1);
Ave_ST_B_2=Ave_ST(CostB,CrossPointNo-1);
Ave_ST_C_2=Ave_ST(CostC,CrossPointNo-1);                            
Ave_ST_A_2(6,1)=2.798921155416282;    %%�����쳣��,��node_Weight�������
Ave_ST_B_2(6,1)=2.861602215072492;
Ave_ST_C_2(6,1)=2.927836827462021;
Ave_ST_All_2=Ave_ST_A_2*0.25+Ave_ST_B_2*0.25+Ave_ST_C_2*0.5;
save("Ave_ST_2.mat","Ave_ST_All_2","Ave_ST_A_2","Ave_ST_B_2","Ave_ST_C_2");

function Ave_ST_OUT=Ave_ST(Cost,CrossPointNo) %% �Ƴ�ĳ���ڵ�֮��,����ƽ�����·��
    Ave_ST_OUT=zeros(CrossPointNo,2);
    for i=1:CrossPointNo
        Cost_temp=Cost;
        Cost_temp(83,:)=[];Cost_temp(:,83)=[]; %%ɾ����һ���ڵ�83                
        Cost_temp(i,:)=[];Cost_temp(:,i)=[];   %%ɾ��Ҫ����Ľڵ�i        
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
%%% NetWork Weight ĳһ�ڵ�ɾ������ƽ�����·��(һЩ����ĵļ��㣩
%%%�Ƴ�83�����Ƴ�6��ʱ���γ�F31,F32,F33,J37�µ�
Ave_ST_temp_A=Ave_ST(CostA,CrossPointNo);
Ave_ST_temp_B=Ave_ST(CostB,CrossPointNo);
Ave_ST_temp_C=Ave_ST(CostC,CrossPointNo);
%Ave_ST_temp_6=Ave_ST_temp_A6*0.25+Ave_ST_temp_B6*0.25+Ave_ST_temp_C6*0.5;
function Ave_ST_OUT=Ave_ST(Cost,CrossPointNo) %% �Ƴ�ĳ���ڵ�֮��,����ƽ�����·��
    Ave_ST_OUT=zeros(CrossPointNo,2);
    %for i=1:CrossPointNo
    i=91;
        Cost_temp=Cost;
        Cost_temp(105,:)=[];Cost_temp(:,105)=[];CrossPointNo=CrossPointNo-1;   %%ɾ���ڵ�105
        Cost_temp(i,:)=[];Cost_temp(:,i)=[];       %%ɾ���ڵ�i
        Cost_temp(90,:)=[];Cost_temp(:,90)=[];CrossPointNo=CrossPointNo-1;     %%ɾ���ڵ�90 
        Cost_temp(89,:)=[];Cost_temp(:,89)=[];CrossPointNo=CrossPointNo-1;     %%ɾ���ڵ�89 
        Cost_temp(83,:)=[];Cost_temp(:,83)=[];CrossPointNo=CrossPointNo-1;     %%ɾ���ڵ�83
        Cost_temp(41,:)=[];Cost_temp(:,41)=[];CrossPointNo=CrossPointNo-1;     %%ɾ���ڵ�41
        Cost_temp(40,:)=[];Cost_temp(:,40)=[];CrossPointNo=CrossPointNo-1;
        Cost_temp(39,:)=[];Cost_temp(:,39)=[];CrossPointNo=CrossPointNo-1;     %%ɾ���ڵ�39
        Cost_temp(14,:)=[];Cost_temp(:,14)=[];CrossPointNo=CrossPointNo-1;     %%ɾ���ڵ�90 
        Cost_temp(13,:)=[];Cost_temp(:,13)=[];CrossPointNo=CrossPointNo-1;     %%ɾ���ڵ�89 
        Cost_temp(12,:)=[];Cost_temp(:,12)=[];CrossPointNo=CrossPointNo-1;     %%ɾ���ڵ�83    
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
    %end
end



function Muti_Cost_Time=Out_ST(Cost,CrossPointNo)
    Muti_Cost_Time=zeros(CrossPointNo,CrossPointNo);
    for i=1:CrossPointNo
        [Min_Distance Path]=ShortestPath_Djk(Cost,CrossPointNo,i);
        Muti_Cost_Time(i,:)=Min_Distance;
    end
end
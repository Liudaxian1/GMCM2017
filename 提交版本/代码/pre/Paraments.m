CrossPointNo=130;%%%����ͼ�нڵ������Ŀ
vA1=45;vA2=70;%%%�ٶ�
vB1=35;vB2=60;
vC1=30;vC2=50;
distance1=xlsread("dis_one.xls");%%%��ȡ����
distance2=xlsread("dis_two.xls");
link1=xlsread("link_one.xls");%%%��ȡ��ͨ��
link2=xlsread("link_two.xls");
distance1=distance1./link1;     %%����ת��
distance2=distance2./link2;
save("Distance.mat","distance1","distance2");
%%Ȩ��
costA1=Cost(CrossPointNo,distance1,vA1);
costB1=Cost(CrossPointNo,distance1,vB1);
costC1=Cost(CrossPointNo,distance1,vC1);
costA2=Cost(CrossPointNo,distance2,vA2);
costB2=Cost(CrossPointNo,distance2,vB2);
costC2=Cost(CrossPointNo,distance2,vC2);
CostA=min(costA1,costA2);   %%�ϲ����ֵ�·
CostB=min(costA1,costB2);
CostC=min(costA1,costC2);
save("Cost.mat","CostA","CostB","CostC");
function cost=Cost(CrossPointNo,distance,v) %%% ��������תΪȨ������
    cost=zeros(CrossPointNo,CrossPointNo);
    cost(:)=inf;
    cost=distance./v;
    %%%%�ڵ���ڵ㱾��ľ���Ϊ�㣬����Cost(i,i)=0
    for i=1:CrossPointNo
        cost(i,i)=0;
    end
end



CrossPointNo=130;%%%����ͼ�нڵ������Ŀ
vA1=45;vA2=70;
vB1=35;vB2=60;
vC1=30;vC2=50;
distance1=xlsread("E:\SystemDocuments\����\GMCM2017\��Ȩ��\dis_one.xls");
distance2=xlsread("E:\SystemDocuments\����\GMCM2017\��Ȩ��\dis_two.xls");
%%%%%����֪�ı߽��и�ֵ��ע�⣺����ͼ��Cost(i,j)=Cost(j,i)

%%ʵ����
costA1=Cost(CrossPointNo,distance1,vA1);
costB1=Cost(CrossPointNo,distance1,vB1);
costC1=Cost(CrossPointNo,distance1,vC1);
costA2=Cost(CrossPointNo,distance2,vA2);
costB2=Cost(CrossPointNo,distance2,vB2);
costC2=Cost(CrossPointNo,distance2,vC2);
CostA=costA1+costA2;
CostB=costA1+costB2;
CostC=costA1+costC2;

function cost=Cost(CrossPointNo,distance,v)
cost=zeros(CrossPointNo,CrossPointNo);
cost(:)=inf;
cost=distance./v;
%for i=1:CrossPointNo
%    for j=1:CrossPointNo
        %if distance(i,j)==65535
        %    distance(i,j)=inf;
        %end
 %       cost(i,j)=distance(i,j)/v;
%    end
%end
%for i=1:CrossPointNo
%    for j=1:CrossPointNo
%        if  cost(i,j) < inf
%            cost(j,i)=cost(i,j);
%        end
%    end
%end
%%%%�ڵ���ڵ㱾��ľ���Ϊ�㣬����Cost(i,i)=0
for i=1:CrossPointNo
    cost(i,i)=0;
end
end



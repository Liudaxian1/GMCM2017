CrossPointNo=130;%%%输入图中节点的总数目
vA1=45;vA2=70;%%%速度
vB1=35;vB2=60;
vC1=30;vC2=50;
distance1=xlsread("dis_one.xls");%%%读取距离
distance2=xlsread("dis_two.xls");
link1=xlsread("link_one.xls");%%%读取连通性
link2=xlsread("link_two.xls");
distance1=distance1./link1;     %%距离转化
distance2=distance2./link2;
save("Distance.mat","distance1","distance2");
%%权重
costA1=Cost(CrossPointNo,distance1,vA1);
costB1=Cost(CrossPointNo,distance1,vB1);
costC1=Cost(CrossPointNo,distance1,vC1);
costA2=Cost(CrossPointNo,distance2,vA2);
costB2=Cost(CrossPointNo,distance2,vB2);
costC2=Cost(CrossPointNo,distance2,vC2);
CostA=min(costA1,costA2);   %%合并两种道路
CostB=min(costA1,costB2);
CostC=min(costA1,costC2);
save("Cost.mat","CostA","CostB","CostC");
function cost=Cost(CrossPointNo,distance,v) %%% 距离数据转为权重数据
    cost=zeros(CrossPointNo,CrossPointNo);
    cost(:)=inf;
    cost=distance./v;
    %%%%节点与节点本身的距离为零，即：Cost(i,i)=0
    for i=1:CrossPointNo
        cost(i,i)=0;
    end
end



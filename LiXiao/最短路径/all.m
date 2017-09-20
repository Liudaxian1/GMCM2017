Muti_Cost_A=Out(CostA,CrossPointNo);
Muti_Cost_B=Out(CostB,CrossPointNo);
Muti_Cost_C=Out(CostC,CrossPointNo);
function Muti_Cost=Out(Cost,CrossPointNo)
Muti_Cost=zeros(CrossPointNo,CrossPointNo);
     for i=1:CrossPointNo
         [a b]=ShortestPath_Djk(Cost,CrossPointNo,i);
         Muti_Cost(i,:)=a;
     end
end

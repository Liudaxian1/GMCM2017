Paraments;
Shortest_Time_A=Out_ST(CostA,CrossPointNo);
Shortest_Time_B=Out_ST(CostB,CrossPointNo);
Shortest_Time_C=Out_ST(CostC,CrossPointNo);
%[Shortest_Time_Out_A,Shortest_Path_Out_A]=STO(CostA,CrossPointNo);
%[Shortest_Time_Out_B,Shortest_Path_Out_B]=STO(CostB,CrossPointNo);
%[Shortest_Time_Out_C,Shortest_Path_Out_C]=STO(CostC,CrossPointNo);
%save("Shortest_Time","Shortest_Time_A","Shortest_Time_B","Shortest_Time_C");
%save("Shortest_Time_Out","Shortest_Time_Out_A","Shortest_Time_Out_B","Shortest_Time_Out_C");
%save("Shortest_Path_Out","Shortest_Path_Out_A","Shortest_Path_Out_B","Shortest_Path_Out_C");
xlswrite("Shortest_Time_A.xls", Shortest_Time_A);
xlswrite("Shortest_Time_B.xls", Shortest_Time_B);
xlswrite("Shortest_Time_C.xls", Shortest_Time_C);
function [Shortest_Time_Out,Shortest_Path_Out] = STO(Cost,CrossPointNo)
    for i=1:CrossPointNo
        for j=1:CrossPointNo
            [Time_Out,Path_Out] = Shortest_Path_Print_All(Cost,i,j,CrossPointNo);
            for k=1:size(Time_Out,2)
                Shortest_Time_Out(i,j,k)=Time_Out(k);
                Shortest_Path_Out(i,j,k)=Path_Out(k);
            %[Shortest_Time_Out(i,f,:),Shortest_Path_Out(i,f,:)] = Shortest_Path_Print_All(Cost,i,f,CrossPointNo);
            end
        end
    end
end
        
    

function Muti_Cost_Time=Out_ST(Cost,CrossPointNo)
    Muti_Cost_Time=zeros(CrossPointNo,CrossPointNo);
    for i=1:CrossPointNo
        [Min_Distance,~]=ShortestPath_Djk(Cost,CrossPointNo,i);
        Muti_Cost_Time(i,:)=Min_Distance;
    end
end


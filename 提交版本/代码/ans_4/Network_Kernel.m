Shortest_Time_A=xlsread('Shortest_Time_A.xls');
Shortest_Time_B=xlsread('Shortest_Time_B.xls');
Shortest_Time_C=xlsread('Shortest_Time_C.xls');
load('Paraments.mat');
for h=0.1:0.1:3
    H=floor(10*h);
    U_Kernel_A(:,H)=Kernel(Shortest_Time_A,h,CrossPointNo);
    U_Kernel_B(:,H)=Kernel(Shortest_Time_B,h,CrossPointNo);
    U_Kernel_C(:,H)=Kernel(Shortest_Time_C,h,CrossPointNo);   
end
U_Kernel_All=U_Kernel_A*0.25+U_Kernel_B*0.25+U_Kernel_C*0.5;
U_Kernel_DW_All=U_Kernel_All;
for i=1:size(U_Kernel_All,2)
    addall=sum(U_Kernel_All(:,i));    
    U_Kernel_DW_All(:,i)=U_Kernel_DW_All(:,i)/addall;
end
[U_h_Value,U_h_Sort]=sort(U_Kernel_DW_All(:,:));
xlswrite("U_h_result.xls",U_h_Sort,"U_h_Sort");
xlswrite("U_h_result.xls",U_h_Value,"U_h_Value");
save("U_Kernel.mat","U_Kernel_All","U_Kernel_A","U_Kernel_B","U_Kernel_C");
function U_Kernel=Kernel(Shortest_Time,h,CrossPointNo)
%%%% Reference:Zhang J, Xu X K, Li P, Zhang K, Small M 2011 Chaos 21 016107
    U_Kernel=zeros(CrossPointNo,1);
    for i=1:CrossPointNo
        for j=1:CrossPointNo
            U_Kernel(i)=U_Kernel(i)+exp(-Shortest_Time(i,j)/(2*h^2));
        end
    end
end
    
    
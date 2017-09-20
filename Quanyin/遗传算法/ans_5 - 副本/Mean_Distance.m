%load Distance_All.mat  %在主函数里先运行这条命令
function F_Distance_Out=Mean_Distance(FPoint_Vector,dis)
    temp=zeros(24,24);
    %for i=1:size(Fpoint_Vector,1)
     %   for j=1:size(FPoint_Vector,2)
     for i=1:24
         for j=1:24
            temp(i,j)=dis(FPoint_Vector(i),FPoint_Vector(j));
        end
    end
    F_Distance_Out=mean(temp(:));
end
        



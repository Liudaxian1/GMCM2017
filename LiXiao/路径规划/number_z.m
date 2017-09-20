function number_z =number_z(i,z_point, t,loc,tim,pri) %判断装载区域实时车辆
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
number_z=0;
for j=1:(i-1)
    flag=(find(pri==j));
    k=1;
    while loc(flag,k)
        if (loc(flag,k)==z_point)&&(loc(flag,k+1)==z_point)
            if (t>=tim(flag,k))&&t<=tim(flag,k+1)
            number_z=number_z+1;%计数            
        end
        k=k+1;
    end    
end

end


clc;clear;
zuobiao=xlsread('坐标.xls');
zuobiao=xlsread('坐标.xls');
ker=load('C:\Users\Leo-mac\ownCloud\汤权银\U_Kernel.mat');
 a=ker.U_Kernel_A;
 A=[zuobiao,a];
 A(:,1)=[];
 x=A(:,1);y=A(:,2);z=A(:,3);
 [xi,yi]=meshgrid(linspace(min(x),max(x),200),linspace(min(y),max(y),100));
 zi=griddata(x,y,z,xi,yi,'cubic');
 contourf(xi,yi,zi) ;hold on;
for i=1:130
    if i<3
        plot(zuobiao(i,2),zuobiao(i,3),'kp');hold on;
    else if 3<=i&i<9
        plot(zuobiao(i,2),zuobiao(i,3),'kd');hold on;
        else if 9<=i&i<68
        plot(zuobiao(i,2),zuobiao(i,3),'ks');hold on;
            else if 68<=i&i<=130
        plot(zuobiao(i,2),zuobiao(i,3),'ko');hold on; 
                end
            end
        end
    end
end
        
road=xlsread('link_one.xls');
for i=1:130
    for j=1:130
        if road(i,j)==1
            plot([zuobiao(i,2);zuobiao(j,2)],[zuobiao(i,3);zuobiao(j,3)],'linewidth',1);
            hold on;
        end
    end
end

road2=xlsread('link_two.xls');
for i=1:130
    for j=1:130
        if road2(i,j)==1
            plot([zuobiao(i,2);zuobiao(j,2)],[zuobiao(i,3);zuobiao(j,3)],'r','linewidth',3);
            hold on;
        end
    end
end

xlabel('X坐标');ylabel('Y坐标');title('作战区域道路图');

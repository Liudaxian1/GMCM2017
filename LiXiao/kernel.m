clc;clear;
zuobiao=xlsread('×ø±ê.xls');
ker=load('C:\Users\Leo-mac\ownCloud\ÌÀÈ¨Òø\U_Kernel.mat');
 a=ker.U_Kernel_A;
 A=[zuobiao,a];
 A(:,1)=[];
 x=A(:,1);y=A(:,2);z=A(:,3);
 [xi,yi]=meshgrid(linspace(min(x),max(x),200),linspace(min(y),max(y),100));
 zi=griddata(x,y,z,xi,yi,'cubic');
 figure(1);
 mesh(xi,yi,zi);
 hold on;
 plot3(x,y,z,'*');
 figure(2);
 contourf(xi,yi,zi) ;
 hold on;
 plot(x,y,'*');
 
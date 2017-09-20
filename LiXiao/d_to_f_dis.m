clc;clear;
dis=xlsread('C:\Users\Leo-mac\ownCloud\ÀîÏö\dis_one.xls');

[distance,path]=floyd(dis);
a=11;b=35;s=[a];t=path(a,b);
for i=1:130
    if t==b
        s=[s,b];break;
    end
    s=[s,t];
    t=path(t,b);
end

        

clc;clear;
%单行
road=xlsread('道路数据.xlsx');
series=road(:,1);
link_one=zeros(130,130);
for i=1:130
    for j=1:7
        a=find(series==road(i,j));
        link_one(i,a)=1;
    end
end
dis_one=link_one;
dis_one(find(dis_one==0))=Inf;
zuobiao=xlsread('坐标.xls');
for i=1:130
    for j=1:130
        if dis_one(i,j)==1
            dis=sqrt((zuobiao(i,3)-zuobiao(j,3))^2+(zuobiao(i,2)-zuobiao(j,2))^2);
            dis_one(i,j)=dis;
        end
    end
end


%双行
road2=xlsread('道路数据.xlsx',2);
link_two=zeros(130,130);
for i=1:20
    a=find(series==road2(i,1));
    for j=1:3
        b=find(series==road2(i,j));
        link_two(a,b)=1;
    end
end
dis_two=link_two;
dis_two(find(dis_two==0))=inf;
for i=1:130
    for j=1:130
        if dis_two(i,j)==1
            dis=sqrt((zuobiao(i,3)-zuobiao(j,3))^2+(zuobiao(i,2)-zuobiao(j,2))^2);
            dis_two(i,j)=dis;
        end
    end
end
xlswrite('dis_one.xls',dis_one);
xlswrite('link_one.xls',link_one);
xlswrite('link_two.xls',link_two);
xlswrite('dis_two.xls',dis_two);



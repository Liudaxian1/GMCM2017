function [time, zhuangzai]= sumtime(zhongqun,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C) %输入种群 发射点 前48个使用
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%%% For Question 3

  [row,line]=size(zhongqun);
  time=zeros(row,1);   
  length=zeros(24,6);%第二段路程时间
  length(:)=inf;
  zhuangzai=zeros(row,24);%记录装载区域
  lujing=zeros(24,300);%路径 24*300的列向量 发射车路线
  % Shortest_Time_A=xlsread('Shortest_Time_A.xls');
  % Shortest_Time_B=xlsread('Shortest_Time_B.xls');
  % Shortest_Time_C=xlsread('Shortest_Time_C.xls');
  for flag=1:row
  for k=1:3 %D1处第一次发射点
      time(flag,1)=time(flag,1)+Shortest_Time_A(zhongqun(flag,k)+8,1);
      lujing(k,1)=zhongqun(1,k);%第二段路径起点 发射点1
  end
  for k=4:6 %D2处第一次发射点
      time(flag,1)=time(flag,1)+Shortest_Time_A(zhongqun(flag,k)+8,2);
      lujing(k,1)=zhongqun(1,k);%第二段路径起点 发射点1
  end
  for k=7:9 %D1处第一次发射点
      time(flag,1)=time(flag,1)+Shortest_Time_B(zhongqun(flag,k)+8,1);
      lujing(k,1)=zhongqun(1,k);%第二段路径起点 发射点1
  end
  for k=10:12 %D2处第一次发射点
      time(flag,1)=time(flag,1)+Shortest_Time_B(zhongqun(flag,k)+8,2);
      lujing(k,1)=zhongqun(1,k);%第二段路径起点 发射点1
  end
  for k=13:18 %D1处第一次发射点
      time(flag,1)=time(flag,1)+Shortest_Time_C(zhongqun(flag,k)+8,1);
      lujing(k,1)=zhongqun(1,k);%第二段路径起点 发射点1
  end
  for k=19:24 %D2处第一次发射点
      time(flag,1)=time(flag,1)+Shortest_Time_C(zhongqun(flag,k)+8,2);
      lujing(k,1)=zhongqun(1,k);%第二段路径起点 发射点1
  end
 for m=1:6
     for n=1:6
         length(m,n)=Shortest_Time_A(zhongqun(flag,m)+8,n+2)+Shortest_Time_A(zhongqun(flag,m+24)+8,n+2);
     end
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%第二段路程终点 转载地域
 end
 
  for m=7:12
     for n=1:6
         length(m,n)=Shortest_Time_B(zhongqun(flag,m)+8,n+2)+Shortest_Time_B(zhongqun(flag,m+24)+8,n+2);
     end
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%第二段路程终点 转载地域
  end
  for m=13:21
     for n=1:6
         length(m,n)=Shortest_Time_C(zhongqun(flag,m)+8,n+2)+Shortest_Time_C(zhongqun(flag,m+24)+8,n+2);
     end
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%第二段路程终点 转载地域
  end
 %for m=22:24
 m=22;
 L3length=zeros(3,350);
 L3length(:)=inf;
     for i=1:6 %%%选择出发点
         for j=i:6
             for k=j:6
                 if i==j && j==k
                      L3length(1,49*i+7*j+k)=inf;L3length(2,49*i+7*j+k)=inf;L3length(3,49*i+7*j+k)=inf;
                 else
                     L3length(1,49*i+7*j+k)=Shortest_Time_C(zhongqun(flag,m)+8,AddNodeNo(i))+Shortest_Time_C(zhongqun(flag,m+24)+8,AddNodeNo(i));
                     L3length(2,49*i+7*j+k)=Shortest_Time_C(zhongqun(flag,m+1)+8,AddNodeNo(j))+Shortest_Time_C(zhongqun(flag,m+1+24)+8,AddNodeNo(j));     
                     L3length(3,49*i+7*j+k)=Shortest_Time_C(zhongqun(flag,m+2)+8,AddNodeNo(k))+Shortest_Time_C(zhongqun(flag,m+2+24)+8,AddNodeNo(k));
                    %length1(i,j,k)=Shortest_Time_C(zhongqun(flag,m)+8,AddNodeNo(i))+Shortest_Time_C(zhongqun(flag,m+24)+8,AddNodeNo(i));
                    %length2(i,j,k)=Shortest_Time_C(zhongqun(flag,m+1)+8,AddNodeNo(j))+Shortest_Time_C(zhongqun(flag,m+1+24)+8,AddNodeNo(j));     
                    %length3(i,j,k)=Shortest_Time_C(zhongqun(flag,m+2)+8,AddNodeNo(k))+Shortest_Time_C(zhongqun(flag,m+2+24)+8,AddNodeNo(k));
                 end
             end
         end
     end
     %Last3time=L3length(1,:)+L3length(2,:)+L3length(3,:);
     [value_min,n_min]=min(L3length(1,:)+L3length(2,:)+L3length(3,:));
     time(flag,1)=time(flag,1)+value_min;
     nmin=dec2base(n_min,7);
     %time(flag,1)=time(flag,1)+min(length(m,:));lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%第二段路程终点 转载地域
     %time(flag,1)=time(flag,1)+min(length(m+1,:));lujing(m+1,2)=min(find(length(m+1,:)==min(length(m+1,:))));%第二段路程终点 转载地域
     %time(flag,1)=time(flag,1)+min(length(m+2,:));lujing(m+2,2)=min(find(length(m+2,:)==min(length(m+2,:))));%第二段路程终点 转载地域
     %lujing(m,2)=L3length(1,AddNodeNo(str2num(nmin(1))));
     lujing(m,2)=AddNodeNo(str2num(nmin(1)));
     lujing(m+1,2)=AddNodeNo(str2num(nmin(2)));
     lujing(m+2,2)=AddNodeNo(str2num(nmin(3)));
  %end
  %lujing(:,2);
  zhuangzai(flag,:)=lujing(:,2)';
  end
end


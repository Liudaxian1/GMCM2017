function [time_All,zhuangzai,mean_Distance1,mean_Distance2,time]= sumtime(zhongqun,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C,dis) %������Ⱥ ����� ǰ48��ʹ��
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
  [row,line]=size(zhongqun);
  time=zeros(row,1);   
  length=zeros(24,6);%�ڶ���·��ʱ��
  lujing=zeros(24,300);%·�� 24*300�������� ���䳵·��
  % Shortest_Time_A=xlsread('Shortest_Time_A.xls');
  % Shortest_Time_B=xlsread('Shortest_Time_B.xls');
  % Shortest_Time_C=xlsread('Shortest_Time_C.xls');
  for flag=1:row
  for k=1:3 %D1����һ�η����
      time(flag,1)=time(flag,1)+Shortest_Time_A(zhongqun(flag,k)+8,1);
      lujing(k,1)=zhongqun(1,k);%�ڶ���·����� �����1
  end
  for k=4:6 %D2����һ�η����
      time(flag,1)=time(flag,1)+Shortest_Time_A(zhongqun(flag,k)+8,2);
      lujing(k,1)=zhongqun(1,k);%�ڶ���·����� �����1
  end
  for k=7:9 %D1����һ�η����
      time(flag,1)=time(flag,1)+Shortest_Time_B(zhongqun(flag,k)+8,1);
      lujing(k,1)=zhongqun(1,k);%�ڶ���·����� �����1
  end
  for k=10:12 %D2����һ�η����
      time(flag,1)=time(flag,1)+Shortest_Time_B(zhongqun(flag,k)+8,2);
      lujing(k,1)=zhongqun(1,k);%�ڶ���·����� �����1
  end
  for k=13:18 %D1����һ�η����
      time(flag,1)=time(flag,1)+Shortest_Time_C(zhongqun(flag,k)+8,1);
      lujing(k,1)=zhongqun(1,k);%�ڶ���·����� �����1
  end
  for k=19:24 %D2����һ�η����
      time(flag,1)=time(flag,1)+Shortest_Time_C(zhongqun(flag,k)+8,2);
      lujing(k,1)=zhongqun(1,k);%�ڶ���·����� �����1
  end
 for m=1:6
     for n=1:6
         length(m,n)=Shortest_Time_A(zhongqun(flag,m)+8,n+2)+Shortest_Time_A(zhongqun(flag,m+24)+8,n+2);
     end
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%�ڶ���·���յ� ת�ص���
 end
 
  for m=7:12
     for n=1:6
         length(m,n)=Shortest_Time_B(zhongqun(flag,m)+8,n+2)+Shortest_Time_B(zhongqun(flag,m+24)+8,n+2);
     end
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%�ڶ���·���յ� ת�ص���
  end
  for m=13:24
     for n=1:6
         length(m,n)=Shortest_Time_C(zhongqun(flag,m)+8,n+2)+Shortest_Time_C(zhongqun(flag,m+24)+8,n+2);
     end
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%�ڶ���·���յ� ת�ص���
  end
  time=time/90;
  mean_Distance1=Mean_Distance(zhongqun(1,1:24),dis)/75;
  mean_Distance2=Mean_Distance(zhongqun(1,25:48),dis)/80;
  time_All=time+mean_Distance1+mean_Distance2;
  zhuangzai(flag,:)=lujing(:,2)';
  end

end


function [time zhuangzai]= sumtime(zhongqun,new_1,new_2) %������Ⱥ ����� ǰ48��ʹ��,��������װ������
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
  [row,line]=size(zhongqun);
  time=zeros(row,1);   
  length=zeros(24,8);%�ڶ���·��ʱ��
  zhuangzai=zeros(row,24);%��¼װ������
  lujing=zeros(24,2);%·�� 24*2�������� ���䳵·��
  Shortest_Time_A=xlsread('Shortest_Time_A.xls');
  Shortest_Time_B=xlsread('Shortest_Time_B.xls');
  Shortest_Time_C=xlsread('Shortest_Time_C.xls');
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
     length(m,7)=Shortest_Time_A(zhongqun(flag,m)+8,new_1)+Shortest_Time_A(zhongqun(flag,m+24)+8,new_1);
     length(m,8)=Shortest_Time_A(zhongqun(flag,m)+8,new_2)+Shortest_Time_A(zhongqun(flag,m+24)+8,new_2);
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%�ڶ���·���յ� ת�ص���
 end
 
  for m=7:12
     for n=1:6
         length(m,n)=Shortest_Time_B(zhongqun(flag,m)+8,n+2)+Shortest_Time_B(zhongqun(flag,m+24)+8,n+2);
     end
     length(m,7)=Shortest_Time_B(zhongqun(flag,m)+8,new_1)+Shortest_Time_B(zhongqun(flag,m+24)+8,new_1);
     length(m,8)=Shortest_Time_B(zhongqun(flag,m)+8,new_2)+Shortest_Time_B(zhongqun(flag,m+24)+8,new_2);
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%�ڶ���·���յ� ת�ص���
  end
  for m=13:24
     for n=1:6
         length(m,n)=Shortest_Time_C(zhongqun(flag,m)+8,n+2)+Shortest_Time_C(zhongqun(flag,m+24)+8,n+2);
     end
     length(m,7)=Shortest_Time_C(zhongqun(flag,m)+8,new_1)+Shortest_Time_C(zhongqun(flag,m+24)+8,new_1);
     length(m,8)=Shortest_Time_C(zhongqun(flag,m)+8,new_2)+Shortest_Time_C(zhongqun(flag,m+24)+8,new_2);
     time(flag,1)=time(flag,1)+min(length(m,:));
     lujing(m,2)=min(find(length(m,:)==min(length(m,:))));%�ڶ���·���յ� ת�ص���
  end
  zhuangzai(flag,:)=lujing(:,2)';
  end
  
 %{
  for i=1:6 %A��
      for j=1:300
          if lujing(i,j)!=0
              time=time+Shortest_Time_A(lujing(i,j),lujing(i+1,j+1));
          end
          else
              break
      end
  end
  for i=7:12
      for j=1:300
          if lujing(i,j)!=0
              time=time+Shortest_Time_B(lujing(i,j),lujing(i+1,j+1));
          end
          else
              break
      end
  end
  for i=13:24
      for j=1:300
          if lujing(i,j)!=0
              time=time+Shortest_Time_C(lujing(i,j),lujing(i+1,j+1));
          end
          else
              break
      end
  end
%}


end


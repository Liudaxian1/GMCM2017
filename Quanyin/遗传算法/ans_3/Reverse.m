%% ������ת����
%����
%SelCh ��ѡ��ĸ���
%���
%SelCh  ������ת��ĸ���
function SelCh=Reverse(SelCh,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C)
[row,col]=size(SelCh);
%ObjV=sumtime(SelCh);  %����·��ʱ��
[ObjV zhuangzai]=sumtime(SelCh,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);  %����·��ʱ��
SelCh1=SelCh;
for i=1:row
    r1=randsrc(1,1,[1:col]);
    r2=randsrc(1,1,[1:col]);
    mininverse=min([r1 r2]);
    maxinverse=max([r1 r2]);
    SelCh1(i,mininverse:maxinverse)=SelCh1(i,maxinverse:-1:mininverse);
end
%ObjV1=sumtime(SelCh);  %����·��ʱ�� 
[ObjV1 zhuangzai]=sumtime(SelCh,AddNodeNo,Shortest_Time_A,Shortest_Time_B,Shortest_Time_C);
index=ObjV1<ObjV;
SelCh(index,:)=SelCh1(index,:);
end
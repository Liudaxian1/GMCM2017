%% ������ת����
%����
%SelCh ��ѡ��ĸ���
%���
%SelCh  ������ת��ĸ���
function SelCh=Reverse(SelCh)
[row,col]=size(SelCh);
[ObjV zhuangzai]=sumtime(SelCh,110,117);  %����·��ʱ��
SelCh1=SelCh;
for i=1:row
    r1=randsrc(1,1,[1:col]);
    r2=randsrc(1,1,[1:col]);
    mininverse=min([r1 r2]);
    maxinverse=max([r1 r2]);
    SelCh1(i,mininverse:maxinverse)=SelCh1(i,maxinverse:-1:mininverse);
end
[ObjV1 zhuangzai1]=sumtime(SelCh,110,117);  %����·��ʱ�� 
index=ObjV1<ObjV;
SelCh(index,:)=SelCh1(index,:);
end
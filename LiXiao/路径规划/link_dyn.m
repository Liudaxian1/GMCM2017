function link_dyn =link_dyn(i,pri, t,loc,tim) %��ǰ���ȼ��������ȼ�����ǰʱ��,�ڵ�·�ߣ��ڵ�ʱ��
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
load link.mat
link_dyn=zeros(130,130);
for j=1:(i-1)
    flag=(find(pri==j));
    k=1;
    while tim(flag,k)
        if (t>tim(flag,k))&&t<tim(flag,k+1)
            link_one(loc(flag,k),loc(flag,k+1))=0;%�����·�ر�            
        end
        k=k+1;
    end    
end
link_dyn=link_one+link_two;

end


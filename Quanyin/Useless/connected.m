function connectedtype = isconnected(ele1,ele2)
%�ж����ڵ����ͨ��
%   �˴���ʾ��ϸ˵��
if strfind(string(Road_General(ele1)),ele2)
    connectedtype=1
else
    if strfind(string(Road_Main(ele1)),ele2)
        connectedtype=2
    else
        connectedtype=0
    end
end
end


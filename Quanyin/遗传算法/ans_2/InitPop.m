%% ��ʼ����Ⱥ
%���룺
% NIND����Ⱥ��С
% N��   ����Ⱦɫ�峤�ȣ�����Ϊ���еĸ�����  
%�����
%��ʼ��Ⱥ
function Chrom= InitPop(NIND,N)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
Chrom=zeros(NIND,N);%���ڴ洢��Ⱥ
for i=1:NIND
    Chrom(i,:)=randperm(N);

end
end


%%Road_Distance
result2=zeros(130,130);
%Elements=xlsread("Elements.xlsx");
for i=string(elements(1:130))
    for j=string(elements(1:130))
        result2(i,j)=Distance(elements(i,2),elements(j,2),elements(i,3),elements(j,3));
    end
end
result2;




time_1=60*xlsread('路径规划结果.xlsx',3);
ruth_1=xlsread('路径规划结果.xlsx',4);
time_2=60*xlsread('路径规划结果.xlsx',5);
ruth_2=xlsread('路径规划结果.xlsx',6);
zpoint=[6,4,5,4,6,6,5,3,4,6,1,2,6,6,6,6,2,5,1,1,6,1,1,6]';%装载位置
fpoint=[11,34,42,28,6,4,43,58,35,3,44,26,37,36,39,38,54,41,46,47,1,25,24,2,19,33,23,31,9,13,20,57,32,8,49,29,7,18,22,21,30,40,45,48,10,51,50,12]';%发射点
[r_1,l_1]=size(time_1);
[r_2,l_2]=size(time_2);
time_max1=max(max(time_1));
time=zeros(24,1);%暴露时间
for row=1:r_1
    line=find(time_1(row,:)==max(time_1(row,:)));
    if time_1(row,line)~=time_max1;
        time_1(row,line+1)=time_max1;
        ruth_1(row,line+1)= ruth_1(row,line);
    end
end

for row=1:24
    line=1;
while time_2(row,line)||line==1
    time_2(row,line)=time_2(row,line)+time_max1;
    line=line+1;
    if line>l_2
        break;
    end
end
end
result=zeros(24,3*(l_1+l_2));%输出结果
for row=1:24
    result(row,1)=time_1(row,1);
    i=2;%第i个节点
    while ruth_1(row,i)
        result(row,3*i-4)=ruth_1(row,i);
        result(row,3*i-3)=time_1(row,i);
        if ruth_1(row,i)==ruth_1(row,i+1)
            result(row,3*i-2)=time_1(row,i+1);
            break;
        else
            result(row,3*i-2)=time_1(row,i);
        end
        i=i+1;
        if (i==l_1)
            result(row,3*i-4)=ruth_1(row,i);
            result(row,3*i-3)=time_1(row,i);
            result(row,3*i-2)=time_2(row,1); 
            i=i+1;
            break;
        end
    end
    j=2;
    while ruth_2(row,j)
        result(row,3*i-4)=ruth_2(row,j);
        result(row,3*i-3)=time_2(row,j);
        if ruth_2(row,j)==ruth_2(row,j+1)
            result(row,3*i-2)=time_2(row,j+1);
            j=j+1;
        else
            if ruth_2(row,j+1)
                result(row,3*i-2)=time_2(row,j);
            end
        end
        i=i+1;
        j=j+1;
        if (j==l_2)
            result(row,3*i-4)=ruth_2(row,j);
            result(row,3*i-3)=time_2(row,j);
            break;
        end
    end
end
for row=1:24
    line=1;
    while result(row,3*line-1)
        if result(row,3*line-1)==(zpoint(row,1)+2)
            time(row,1)=time(row,1)+result(row,3*line)-result(row,3*line-2);
        else
            time(row,1)=time(row,1)+result(row,3*line+1)-result(row,3*line-2);
        end
        line=line+1;
        if result(row,3*line+1)==0
            time(row,1)=time(row,1)+result(row,3*line)-result(row,3*line-2);
            break;
        end
    end
end
sum_time=sum(time)/60;
    
    
    

    
        

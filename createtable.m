function [namechip,lines]=createtable(rmfile,chiptype)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%change this to make if for a 3by4 or 4by5
rmfilename=char(strcat(rmfile,'/README.txt'));
lines=textread(rmfilename,'%s','delimiter','\n');
numlines=str2num(char(lines(1)));

x=1;
if chiptype==1
    rowmax=4;
    colmax=5;
end
if chiptype==2
    rowmax=4;
    colmax=3;
end
storechipvalues=zeros(rowmax,colmax);
namechip=cell(rowmax,colmax);
for r=1:rowmax
    for c=1:colmax
        storechipvalues(r,c)=x;
        x=x+1;
    end
end

for r=1:rowmax
    for c=1:colmax
        for p=2:(numlines+1)
            storelines=str2num(char(lines(p)));
            storelines=storelines';
            for s=1:numel(storelines)
            if storechipvalues(r,c)==storelines(s);
                namechip{r,c}=char(lines(p+numlines));
            end
            end
        end
    end
end

end


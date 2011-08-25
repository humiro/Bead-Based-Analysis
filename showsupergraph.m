function [xs ys]=showsupergraph(xholder, yholder,yfitholder,slopeholder,conc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

markers={'b','g','c','y','k','m','r','w'};
concholder=cell(1,numel(conc));
for j=1:numel(conc)
    charconc=char(num2str(conc(j)));
    concholder{j}=charconc;
end
p=1;
for i=1:numel(xholder)
    x=xholder{i};
    y=yholder{i};
    yfit=yfitholder{i};
%     scatter(x,yfit);
    plot(x,yfit,markers{i});
    hold on
    if i==1
        ys(p)=slopeholder(i);
        xs(p)=conc(i);
        p=p+1;
    else
        if slopeholder(i)> slopeholder(i-1)
            xs(p)=conc(i);
            ys(p)=slopeholder(i);
            p=p+1;
        end
    end
end
legend(concholder)
hold off
% slopegraph(xs,ys);
% scatter(xs,ys)
end


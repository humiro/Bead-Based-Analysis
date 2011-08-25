function [xholder yholder yfitholder slopeholder interceptholder]=supergraph( intensityvalues,groupselected, exposures, conc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Ivalues=intensityvalues{groupselected};
yholder=cell(1,numel(conc));
xholder=cell(1,numel(conc));
yfitholder=cell(1,numel(conc));
slopeholder=zeros(1,numel(conc));
interceptholder=zeros(1,numel(conc));
for c=1:numel(conc)
initialy=Ivalues(c,:);

rsquared=0;
start=1;
while rsquared<.9 && start<numel(exposures)
    p=1;
    finaly=[];
    x=[];
    for u=start:numel(exposures)
        if initialy(u)<200
        finaly(p)=initialy(u);
        x(p)=exposures(u);
        p=p+1;
        end
    end
    spval=polyfit(x,finaly,1);
    yfit=polyval(spval,x);
    resid=finaly-yfit;
    linresid=sum(resid.^2);
    lintot=(length(finaly)-1)*var(finaly);
    rsquared=1-(linresid/lintot);
    start=start+1;
end

yfitholder{c}=yfit;
yholder{c}=finaly;
xholder{c}=x;
slopeholder(c)=spval(1);
interceptholder(c)=spval(2);


end


end


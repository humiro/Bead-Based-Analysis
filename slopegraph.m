function slopegraph( xs,ys )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
scatter(xs,ys);
hold on;
sval=polyfit(xs,ys,1);
ysfit=polyval(sval,xs);
resid=ys-ysfit;
linresid=sum(resid.^2);
lintot=(length(ys)-1)*var(ys);
rsquared=1-(linresid/lintot)
plot(xs,ysfit);


end


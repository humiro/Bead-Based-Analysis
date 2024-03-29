function [y] = sigmoidfun(beta,x)

yscale = beta(1);
yoffset = beta(2);
xoffset = beta(3);
k = beta(4);
y = yscale./(1+(exp(-k.*(x-xoffset))))+yoffset;
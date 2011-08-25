function [y] = log4param(beta,x)
% function [y] = log4param(beta,x)
%y = a+b*(exp(c-d*log(x)))./(1+exp(c - d*log(x)));
a = beta(1);
b = beta(2);
c = beta(3);
d = beta(4);
y = a-b*(exp(c-d*log(x)))./(1+exp(c - d*log(x)));
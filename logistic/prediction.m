function [prediction_value] = prediction(beta,conc,sample_intensity)
% Benjamin Grant, Rice University McDevitt Lab 09/14/2010
% function [intensity] = log4param(beta,conc)                             
% This function is used to produce 4 parameter logistic curves given
% concentration values from a dose response curve and the parameters
% defining the curve, a,b ,c and d given in a vector beta. Raw data should
% be given to dose_response which determines these parameters based on
% intesnity and concentration values recorded in the lab
% concentration = a+b*(exp(c-d*log(conc)))./(1+exp(c - d*log(conc)));
a = beta(1);
b = beta(2);
c = beta(3);
d = beta(4);
intensity = a+b*(exp(c-d*log(conc)))./(1+exp(c - d*log(conc)));
difffromsample_array=zeros(1,numel(intensity));
sample_intensity;
for i=1:numel(intensity)
        differencefromsample=abs(intensity(i)-sample_intensity);
        difffromsample_array(1,i)=differencefromsample;
end
mindiff=min(difffromsample_array);
if isnan(mindiff)
     prediction_value=0;
else
   for r=1:numel(difffromsample_array);
        if (mindiff==difffromsample_array(r))
          guess=r;
        end
   end
    prediction_value=conc(guess);
end






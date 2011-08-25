% Use skipsize (number of skipped lines for each exposure) 
% and each group of 14 corresponds to one concentration
function  CV_Graph(inputCV, conc, exposures, gs);
%skipsize = 14;
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%x=conc;
%figure;
%bar(x,y,'histc');

% a = length(exposure1) * length(concentration);
% b = length(CVDATA.data(:,3));
ycv=inputCV{gs};
figure;
bar3(ycv)
set(gca,'YTickLabel',conc)
set(gca,'XTickLabel',exposures)
xlabel('Exposure(s)','fontsize',16)
ylabel('Concentration','fontsize',16)
zlabel('CV','fontsize',16)
title('3D Bar Plot Relating Exposure,Concentration,and CV','fontsize',16)
end


function [conc,exposures]=makearrays(namefolder,lines)

%creates text files to store data by group
foldername=char(namefolder);
locofsumfiles=dir(foldername);
storelocations= cell(1,numel(locofsumfiles));
dlgprompt='Enter concentrations:';
totnumlines=numel(lines);
conc=[]
% conc=str2num(char(lines(totnumlines-1)));
inputconc=inputdlg(dlgprompt);
conc(1,:)=str2num(inputconc{1});
dlgprompt='Enter exposures:';
% exposures=str2num(char(lines(totnumlines)));
inputexp=inputdlg(dlgprompt);
exposures(1,:)=str2num(inputexp{1});
dlgprompt2='Enter exposures';
numexposures=[];
% inputnumexposures=inputdlg(dlgprompt2);
% numexposures(1,:)=str2num(inputnumexposures{1});

end


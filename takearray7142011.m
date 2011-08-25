function [intensityvalues sdvalues cvvalues]=takearray7142011(hms,xval,folder,exposures,numofmethods,whichmethod)
%create matrices to store LP values
conc=xval;
namefolder=char(folder);
grp1lp=zeros(numel(conc),numel(exposures));
grp2lp=zeros(numel(conc),numel(exposures));
grp3lp=zeros(numel(conc),numel(exposures));
grp4lp=zeros(numel(conc),numel(exposures));
grp5lp=zeros(numel(conc),numel(exposures));
grp6lp=zeros(numel(conc),numel(exposures));
grp7lp=zeros(numel(conc),numel(exposures));
grp8lp=zeros(numel(conc),numel(exposures));
%create matrices to store LP SD values
grp1lpsd=zeros(numel(conc),numel(exposures));
grp2lpsd=zeros(numel(conc),numel(exposures));
grp3lpsd=zeros(numel(conc),numel(exposures));
grp4lpsd=zeros(numel(conc),numel(exposures));
grp5lpsd=zeros(numel(conc),numel(exposures));
grp6lpsd=zeros(numel(conc),numel(exposures));
grp7lpsd=zeros(numel(conc),numel(exposures));
grp8lpsd=zeros(numel(conc),numel(exposures));
%create matrices to store LP CV values
grp1lpcv=zeros(numel(conc),numel(exposures));
grp2lpcv=zeros(numel(conc),numel(exposures));
grp3lpcv=zeros(numel(conc),numel(exposures));
grp4lpcv=zeros(numel(conc),numel(exposures));
grp5lpcv=zeros(numel(conc),numel(exposures));
grp6lpcv=zeros(numel(conc),numel(exposures));
grp7lpcv=zeros(numel(conc),numel(exposures));
grp8lpcv=zeros(numel(conc),numel(exposures));

% locofsumfiles=dir(namefolder);
% storelocations= cell(1,numel(locofsumfiles));
if hms==1
    skipnumber=numofmethods*3+3;
else
    skipnumber=numofmethods*3+4;
end

startnumber=(skipnumber+((whichmethod-1)*3))+2;




for r=1:numel(conc);
    if ispc
        testlc= sprintf('\\%1.1f ngperml\\Results\\',conc(r));
    end
    if ismac
        testlc= sprintf('//%1.1f ngperml//Results//',conc(r));
    end
    fpofname=strcat(namefolder,testlc);
    summaryfiles=dir(fullfile(fpofname,'*summary*.txt'));
    storedfiles=cell(1,numel(summaryfiles));
    for h = 1:numel(summaryfiles) 
        storedfiles{h} = summaryfiles(h).name;
    end
        for t=1:numel(summaryfiles)
            storedfilename=char(strcat(fpofname,storedfiles(t)));
            sumlines=textread(storedfilename,'%s','delimiter',' ');
            %store LP values
            grp1lp(r,t)=str2double(char(sumlines(startnumber)));
            grp2lp(r,t)=str2double(char(sumlines(startnumber+skipnumber)));
            grp3lp(r,t)=str2double(char(sumlines(startnumber+2*skipnumber)));
            grp4lp(r,t)=str2double(char(sumlines(startnumber+3*skipnumber)));
            grp5lp(r,t)=str2double(char(sumlines(startnumber+4*skipnumber)));
            grp6lp(r,t)=str2double(char(sumlines(startnumber+5*skipnumber)));
            grp7lp(r,t)=str2double(char(sumlines(startnumber+6*skipnumber)));
            grp8lp(r,t)=str2double(char(sumlines(startnumber+7*skipnumber)));
            %store LP SD values
            grp1lpsd(r,t)=str2double(char(sumlines((startnumber+1))));
            grp2lpsd(r,t)=str2double(char(sumlines((startnumber+1)+skipnumber)));
            grp3lpsd(r,t)=str2double(char(sumlines((startnumber+1)+2*skipnumber)));
            grp4lpsd(r,t)=str2double(char(sumlines((startnumber+1)+3*skipnumber)));
            grp5lpsd(r,t)=str2double(char(sumlines((startnumber+1)+4*skipnumber)));
            grp6lpsd(r,t)=str2double(char(sumlines((startnumber+1)+5*skipnumber)));
            grp7lpsd(r,t)=str2double(char(sumlines((startnumber+1)+6*skipnumber)));
            grp8lpsd(r,t)=str2double(char(sumlines((startnumber+1)+7*skipnumber)));
            %store LP CV values
            grp1lpcv(r,t)=str2double(char(sumlines(startnumber+2)));
            grp2lpcv(r,t)=str2double(char(sumlines((startnumber+2)+skipnumber)));
            grp3lpcv(r,t)=str2double(char(sumlines((startnumber+2)+2*skipnumber)));
            grp4lpcv(r,t)=str2double(char(sumlines((startnumber+2)+3*skipnumber)));
            grp5lpcv(r,t)=str2double(char(sumlines((startnumber+2)+4*skipnumber)));
            grp6lpcv(r,t)=str2double(char(sumlines((startnumber+2)+5*skipnumber)));
            grp7lpcv(r,t)=str2double(char(sumlines((startnumber+2)+6*skipnumber)));
            grp8lpcv(r,t)=str2double(char(sumlines((startnumber+2)+7*skipnumber)));
 
       end
end

intensityvalues={grp1lp,grp2lp,grp3lp,grp4lp,grp5lp,grp6lp,grp7lp,grp8lp};
sdvalues={grp1lpsd,grp2lpsd,grp3lpsd,grp4lpsd,grp5lpsd,grp6lpsd,grp7lpsd,grp8lpsd};
cvvalues={grp1lpcv,grp2lpcv,grp3lpcv,grp4lpcv,grp5lpcv,grp6lpcv,grp7lpcv,grp8lpcv};


end


function  [outputlp outputsd outputcv] = zerounknown(hms,folder,exposures,dist,numofmethods,whichmethod)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
           ukIholder=cell(1,numel(folder));
           ukSDholder=cell(1,numel(folder));
           ukCVholder=cell(1,numel(folder));
%create matrices to store LP values
outputlp=zeros(8,numel(exposures));
%create matrices to store LP SD values
outputsd=zeros(8,numel(exposures));
%create matrices to store LP CV values
outputcv=zeros(8,numel(exposures));

%setting up counter values
if hms==1
    skipnumber=numofmethods*3+3;
else
    skipnumber=numofmethods*3+4;
end

startnumber=(skipnumber+((whichmethod-1)*3))+2;
%locofsumfiles=dir(folder);
for w=1:numel(folder)
% storelocations= cell(1,numel(locofsumfiles));
if ispc
    if(dist==1)
        testlc= '\0.0 ngperml\Results\';
    else
        testlc='\Results\';
    end
end
if ismac
    if(dist==1)
    testlc= '/0.0 ngperml/Results/';
    else
        testlc='/Results/';
    end
end

fpofname=char(strcat(folder{w},testlc));
summaryfiles=dir(fullfile(fpofname,'*summary*.txt'));
storedfiles=cell(1,numel(summaryfiles));
for h = 1:numel(summaryfiles) 
    storedfiles{h} = summaryfiles(h).name;
end 
for t=1:numel(summaryfiles)
    storedfilename=char(strcat(fpofname,storedfiles(t)));
    sumlines=textread(storedfilename,'%s','delimiter',' ');
            %store LP values
            outputlp(1,t)=str2double(char(sumlines(startnumber)));
            outputlp(2,t)=str2double(char(sumlines(startnumber+skipnumber)));
            outputlp(3,t)=str2double(char(sumlines(startnumber+2*skipnumber)));
            outputlp(4,t)=str2double(char(sumlines(startnumber+3*skipnumber)));
            outputlp(5,t)=str2double(char(sumlines(startnumber+4*skipnumber)));
            outputlp(6,t)=str2double(char(sumlines(startnumber+5*skipnumber)));
            outputlp(7,t)=str2double(char(sumlines(startnumber+6*skipnumber)));
            outputlp(8,t)=str2double(char(sumlines(startnumber+7*skipnumber)));
            %store LP SD values
            outputsd(1,t)=str2double(char(sumlines((startnumber+1))));
            outputsd(2,t)=str2double(char(sumlines((startnumber+1)+skipnumber)));
            outputsd(3,t)=str2double(char(sumlines((startnumber+1)+2*skipnumber)));
            outputsd(4,t)=str2double(char(sumlines((startnumber+1)+3*skipnumber)));
            outputsd(5,t)=str2double(char(sumlines((startnumber+1)+4*skipnumber)));
            outputsd(6,t)=str2double(char(sumlines((startnumber+1)+5*skipnumber)));
            outputsd(7,t)=str2double(char(sumlines((startnumber+1)+6*skipnumber)));
            outputsd(8,t)=str2double(char(sumlines((startnumber+1)+7*skipnumber)));
            %store LP CV values
            outputcv(1,t)=str2double(char(sumlines((startnumber+2))));
            outputcv(2,t)=str2double(char(sumlines((startnumber+1)+skipnumber)));
            outputcv(3,t)=str2double(char(sumlines((startnumber+1)+2*skipnumber)));
            outputcv(4,t)=str2double(char(sumlines((startnumber+1)+3*skipnumber)));
            outputcv(5,t)=str2double(char(sumlines((startnumber+1)+4*skipnumber)));
            outputcv(6,t)=str2double(char(sumlines((startnumber+1)+5*skipnumber)));
            outputcv(7,t)=str2double(char(sumlines((startnumber+1)+6*skipnumber)));
            outputcv(8,t)=str2double(char(sumlines((startnumber+1)+7*skipnumber)));
end
       if dist>1

           ukIholder(1,w)={outputlp};
           ukSDholder(1,w)={outputsd};
           ukCVholder(1,w)={outputcv};
%            if w==1
%                ukLP=outputlp;
%                ukLPSD=outputsd;
%                ukLPCV=outputcv;
%            else
%                ukLP={ukLP,outputlp};
%                ukLPSD={ukLPSD,outputsd};
%                ukLPCV={ukLPCV,outputcv};
%            end
       end
end

if dist>1
    outputlp=ukIholder;
    outputsd=ukSDholder;
    outputcv=ukCVholder;
end

       




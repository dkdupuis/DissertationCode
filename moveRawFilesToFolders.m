function moveRawFilesToFolders()


bvaExportFolder='E:\PATHS to Success EEG Data\Time 1 Wave 1\Data\Critter\CritterT1W1_ERP\CritterT1W1_ERP_export\Temp\';
newFolder='E:\Dave\Dissertation Data\t3\';
subFolder='\Cz';
%folderListFile='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T2\IDs.txt';
%f=fopen(folderListFile);

%a= fscanf(f, '%s');
%num=length(a);


%%%Make Folder Structure from list
%a=fgets(f);
%while ischar(a)
%    
%    mkdir(strcat(newFolder,a));
%    a=fgets(f);
%end

%for i=1:1:num
   
%    mkdir(strcat(newFolder,a(i)));
    
%end


%dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz';
%runLoc='C:\Users\dud164\Documents\MATLAB\Woody\';
%par=strcat(runLoc,'par.doc');
%dat=strcat(runLoc,'dat.doc');
%wout=strcat(runLoc,'wout.doc');

%%%Make Folder strucure
referenceFolder=bvaExportFolder;
f=dir(referenceFolder);
preNum=size(f);
numFolders=preNum(1);
for i=3:1:numFolders
    t=f(i).name;
    mkdir([newFolder t(1) t(2) t(3) t(4) t(5) t(6) subFolder]);
end

%%%%%Move Files

file=dir(bvaExportFolder);
preNum=size(file);
numFiles=preNum(1);

folder=dir(newFolder);
numFolders=length(folder);

for i=3:1:numFiles    
    if(file(i).isdir~=1)        
        for r=3:1:numFolders           
            if(folder(r).isdir==1)                
                if(length(strfind(file(i).name,folder(r).name))==1)
                    
                   movefile(strcat(bvaExportFolder,file(i).name),strcat(newFolder,folder(r).name,subFolder,'\',file(i).name),'f');
                    
                end               
            end                        
        end     
    end  
end
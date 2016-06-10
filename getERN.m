function getERN()


homeDir='E:\Dave\Dissertation Data\';
f=dir(homeDir);
numHomeFiles=length(f);

for i=3:1:numHomeFiles
    if(f(i).isdir==1)
        
        subDir=[homeDir f(i).name '\'];
        outputFile=fopen([homeDir f(i).name '_FzERNPeakOutPut.txt'],'wt');
        subF=dir(subDir);
        numSubFiles=length(subF);
        
        for k=3:1:numSubFiles
            if(subF(k).isdir==1)
            
                idFold=[subDir subF(k).name '\Fz\'];
                idDir=dir(idFold);
                if(length(idDir)==3)

                    idFile=fopen([idFold idDir(3).name]);

                    fgetl(idFile);
                    dataRaw=fscanf(idFile, '%f');
                    fclose(idFile);
                    
                    numTrials=length(dataRaw)/819;
                    if(numTrials==floor(numTrials))
                    
                        data=zeros(numTrials, 819);

                        for r=1:1:numTrials
                            temp=(r-1)*819;
                            for c=1:1:819
                                data(r,c)=dataRaw(temp+c);
                            end
                        end
                        
                        avgERN=0;
                        preBaseMax=-999;
                        ernMin=999;
                        avgData=mean(data,1);

                        for p=359:1:409
                            
                            %avgERN=avgERN+mean(data(:,p));
                            if(preBaseMax<avgData(p))
                               
                                preBaseMax=avgData(p);
                            end
                            
                        end                        
                        
                        for p=409:1:460
                            
                            avgERN=avgERN+mean(data(:,p));
                            if(ernMin>avgData(p))
                               
                                ernMin=avgData(p);
                            end
                            
                        end
                        
%                         if(numTrials>0)
%                             
%                             fprintf(outputFile, '%s\t%f\t%f\n',subF(k).name, numTrials, avgERN/52);
%                             
%                         end
                        
                        if(ernMin~=999)
                            
                            fprintf(outputFile, '%s\t%f\t%f\n',subF(k).name, numTrials, -preBaseMax+ernMin);
                            
                        end
                        
                    else
                        
                        fprintf(outputFile, '%s\n', [subF(k).name 'not sampled at 512Hz or segmented incorrectly']);
                                                
                    end
                end
            end
        end
            
        fclose(outputFile);
    end
end
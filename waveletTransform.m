function waveletTransform()
%%Includes Morlet Wavelets graph
iT=-.798828125;
dT=1.953125/1000;

windowLengthInMs=.375;
windowLengthInDataPoints=(windowLengthInMs*1000)/1.953125;
f=1:10;
t=iT+windowLengthInDataPoints*dT:dT:iT+(819-windowLengthInDataPoints)*dT;    %iT+768*dT;
alpha=4.7;

%sigmaF=f/alpha;
%sigmaT=1/(2*pi*sigmaF);
sigmaT=1./(2*pi*(f/alpha));
phi_T_F=zeros(length(t),10);

for tee=1:1:length(t)
    for eff=1:10
       
        phi_T_F(tee,eff)=(1/(sqrt(pi)*sigmaT(eff)))*exp((-t(tee)*t(tee))/(2*sigmaT(eff)*sigmaT(eff)))*(exp(sqrt(-1)*2*pi*eff*t(tee))-exp((-alpha*alpha)/2));
        
    end
end

pR=zeros(length(t),1);
pI=zeros(length(t),1);

for tee=1:1:length(t)
    
    pR(tee)=real(phi_T_F(tee,8));
    pI(tee)=imag(phi_T_F(tee,8));
    
end
figure(8);
plot(t*1000,pR/6.0346,'color','k');
hold on;
plot(t*1000,pI/6.0346,'--','color','k');
axis([-375 375 -1 1]);
xlabel('Time (ms)');
legend('Real Component','Imaginary Component');
hold off;
tic

homeDir='E:\Dave\Dissertation Data\';
fDir=dir(homeDir);
numHomeFiles=length(fDir);
numCwtPointsPerTrial=819-length(t)+1;
sumCwtData=zeros(numCwtPointsPerTrial,10,3);
sumCoherence=zeros(numCwtPointsPerTrial,10,3);
wave=0;
numPart=[0 0 0];

for i=3:1:numHomeFiles
    if(fDir(i).isdir==1)
        
        wave=wave+1;
        fDir(i).name
        subDir=[homeDir fDir(i).name '\'];
        outputFile=fopen([homeDir fDir(i).name '_CzOutPut.txt'],'wt');
        subF=dir(subDir);
        numSubFiles=length(subF);
        
        for k=3:1:numSubFiles
            if(subF(k).isdir==1)
            
                idFold=[subDir subF(k).name '\Cz\'];
                idDir=dir(idFold);
                if(length(idDir)==3)
                    %[idFold idDir(3).name]
                    idFile=fopen([idFold idDir(3).name]);
                    %idFile=fopen('E:\Dave\Dissertation Data\t1\104209\Fz\104209_critter_5_22_09_t1_noGoErr_Fz.dat');

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

                        cwtData=zeros(numTrials, numCwtPointsPerTrial,10);
                        L=819-length(t)+1;
                        lengthT=length(t);

                        for r=1:1:numTrials
                            %for c=1:1:L
                                %for tee=1:1:lengthT
                                    for eff=1:10
                                        %size(cwtData)
                                        %size(data)
                                        %size(phi_T_F)
                                        %size(conv(data(r,:),phi_T_F(:,6),'valid'))
                                        cwtData(r,:,eff)=conv(data(r,:),phi_T_F(:,eff),'valid');
                                        %sumCwtData(:,eff,wave)=sumCwtData(:,eff,wave)+sqrt(real(transpose(cwtData(r,:,eff))).*real(transpose(cwtData(r,:,eff)))+imag(transpose(cwtData(r,:,eff))).*imag(transpose(cwtData(r,:,eff))));
                                    end
                                %end
                            %end
                        end
                        
                        %power
                        phase=atan2(imag(cwtData),real(cwtData));
                        
                        %min(min(min(phase)))
                        %max(max(max(phase)))
                        %mean(mean(mean(phase)))
                        %'%n'
                        %mag=mean((imag(cwtData(:,52,7)).*imag(cwtData(:,52,7))+real(cwtData(:,52,7)).*real(cwtData(:,52,7))).^(1/2));
                        
                                %phase=atan(imag(cwtData(:,52,7))./real(cwtData(:,52,7)));
                                %avgPhase=mean(phase);
                                %coher=abs(mean(exp(sqrt(-1)*(avgPhase-phase))));
                        
                        
                        avgPhase=mean(phase,1);
                        avgPhase=reshape(avgPhase,numCwtPointsPerTrial,10);
                        %size(avgPhase)
                        %size(phase)
                        %ima=sqrt(-1)*(avgPhase-phase)
                        %expP=exp(ima)
                        %meanExp=mean(expP)
                        %absM=abs(meanExp)
                        %coher=absM
                        coher=zeros(819-length(t)+1,10);
                        %size(reshape(phase(1,:,:),numCwtPointsPerTrial,10))
                        %size(avgPhase-reshape(phase(r,:,:),numCwtPointsPerTrial,10))
                        %size(coher)
                        %coher=coher+abs(mean(expm(sqrt(-1)*(avgPhase-phase))));
                        %coher=abs(mean(exp(sqrt(-1)*(avgPhase-phase))));
                        for r=1:1:numTrials
                            
                            coher=coher+exp(sqrt(-1)*(avgPhase-reshape(phase(r,:,:),numCwtPointsPerTrial,10)));
                            
                        end
                        coher=abs(coher/numTrials);
                        sumCoherence(:,:,wave)=sumCoherence(:,:,wave)+coher;
                        
                        
                        mag=(imag(cwtData).*imag(cwtData)+real(cwtData).*real(cwtData)).^(1/2);
                        
                        magPart=mean(mag,1);
                        magPart=reshape(magPart,numCwtPointsPerTrial,10);
                        
                        
                        %%%Baseline to first 100 ms of data
%                         baseMag=zeros(1,10);
%     
%                         for r=1:1:51
%                            
%                             baseMag=baseMag+magPart(r,:);
%                             
%                         end                       
%                         baseMag=baseMag/51;
                        %%%Baseline to average
                        %baseMag=mean(magPart,1);
                        %%%No Baseline
                        baseMag=zeros(1,10)+1;
                        
                        magPart=10*log10(magPart./repmat(baseMag,numCwtPointsPerTrial,1));
                        
%                         for eff=1:1:10
%                             
%                             magPart(:,eff)=10*(log10(baseMag./mag(:,eff)));
%                             
%                         end
                        if( numTrials>0)
                            sumCwtData(:,:,wave)=sumCwtData(:,:,wave)+magPart;
                        end
                        
                        
                        magOut=zeros(1,10);
                        coherOut=zeros(1,10);
                        
                        for r=numCwtPointsPerTrial/2:1:numCwtPointsPerTrial/2+51
                        %for r=1:1:51
                            
                            magOut=magOut+magPart(r,:);
                            coherOut=coherOut+coher(r,:);
                            numPart(wave)=numPart(wave)+1;
                            
                        end
                        
                        magOut=magOut/51;
                        coherOut=coherOut/51;
                        
                        %mag=mean((imag(cwtData(:,52,7)).*imag(cwtData(:,52,7))+real(cwtData(:,52,7)).*real(cwtData(:,52,7))).^(1/2));
                        mean(sqrt((imag(cwtData(:,52,7)).*imag(cwtData(:,52,7))+real(cwtData(:,52,7)).*real(cwtData(:,52,7))).^(1/2)))
                        %size(coher)
                        if( numTrials>0)
                            
                            fprintf(outputFile, '%s\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n',subF(k).name,magOut(4),magOut(5),magOut(6),magOut(7),magOut(8),coherOut(4),coherOut(5),coherOut(6),coherOut(7),coherOut(8));
                        
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

toc
%sumCwtData=sqrt(imag(sumCwtData).*imag(sumCwtData)+real(sumCwtData).*real(sumCwtData));
%sumCwtData=sumCwtData/(numSubFiles-3);


%%%Phase Graphs
% iT1=iT+windowLengthInDataPoints*dT;
% t1=iT1:dT:.800-windowLengthInDataPoints*dT;
% 
% w1=sumCoherence(:,:,1)/numPart(1);
% w2=sumCoherence(:,:,2)/numPart(2);
% w3=sumCoherence(:,:,3)/numPart(3);
% w1=transpose(w1);
% w2=transpose(w2);
% w3=transpose(w3);
% 
% figure(11)
% imagesc(t1,f,w1);
% axis xy
% xlabel('Time Post Response (s)');
% ylabel('Frequency (Hz)');
% title('w1');
% 
% figure(22)
% imagesc(t1,f,w2);
% axis xy
% xlabel('Time Post Response (s)');
% ylabel('Frequency (Hz)');
% title('w2');
% 
% figure(23)
% imagesc(t1,f,w3);
% axis xy
% xlabel('Time Post Response (s)');
% ylabel('Frequency (Hz)');
% title('w3');

%%%Magnitude Graphs
w1=sumCwtData(:,:,1)/numPart(1);
w2=sumCwtData(:,:,2)/numPart(2);
w3=sumCwtData(:,:,3)/numPart(3);
w1=transpose(w1);
w2=transpose(w2);
w3=transpose(w3);
size(w1)
%%Baseline Normalize
% for i=1:1:3
%     for k=1:1:length(f)
%          for r=101:1:length(w1)
%              %sumCwtData(k,r)=sumCwtData(k,r)./sumCwtData(k,1);
%              w1(k,r)=w1(k,r)./w1(k,1);
%              w2(k,r)=w2(k,r)./w2(k,1);
%              w3(k,r)=w3(k,r)./w3(k,1);
%          end
%          %sumCwtData(k,1)=1;
%          w1(k,1)=1;
%          w2(k,1)=1;
%          w3(k,1)=1;
%      end
%  end

%iT1=iT+windowLengthInDataPoints*dT;
%t1=iT1:dT:.800-windowLengthInDataPoints*dT;
t1=(-numCwtPointsPerTrial/2)*dT:dT:(numCwtPointsPerTrial/2)*dT;
size(t1)
size(f)
size(w1)
figure(1)
%size(t1)
%size(f)
%size(log10(sumCwtData))

imagesc(t1,f,w1);
axis xy
xlabel('Time Post Response (s)');
ylabel('Frequency (Hz)');
title('w1');

figure(2)
imagesc(t1,f,w2);
axis xy
xlabel('Time Post Response (s)');
ylabel('Frequency (Hz)');
title('w2');

figure(3)
imagesc(t1,f,w3);
axis xy
xlabel('Time Post Response (s)');
ylabel('Frequency (Hz)');
title('w3');
function plotPredOverRaw()

datFile=fopen('C:\Users\dud164\Documents\MATLAB\Dissertation\graphMeasureRaw.txt');
dat= fscanf(datFile, '%f');
fclose(datFile);
numParts=length(dat)/16;
numBoys=0;
numGirls=0;

intERN=-1.609;
slopeERN=-.118;
intAveStr=33.393;
slopeAveStr=-.219;
intSTC=-1.713;
slopeSTC=.094;
genSTC=-.049;
genAgeSTC=.042;
intRTV=518.93;
slopeRTV=-39.330;
genRTV=-.591;
genAgeRTV=-5.063;

for i=0:1:numParts-1
   
    if(dat(i*16+1)==1)
        
        numBoys=numBoys+1;
        ageBoys(i*3+1)=dat(i*16+2);
        ageBoys(i*3+2)=dat(i*16+3);
        ageBoys(i*3+3)=dat(i*16+4);
        ernBoys(i*3+1)=dat(i*16+5);
        ernBoys(i*3+2)=dat(i*16+6);
        ernBoys(i*3+3)=dat(i*16+7);
        aveStrBoys(i*3+1)=dat(i*16+8);
        aveStrBoys(i*3+2)=dat(i*16+9);
        aveStrBoys(i*3+3)=dat(i*16+10);
        sigConBoys(i*3+1)=dat(i*16+11);
        sigConBoys(i*3+2)=dat(i*16+12);
        sigConBoys(i*3+3)=dat(i*16+13);
        rtvBoys(i*3+1)=dat(i*16+14);
        rtvBoys(i*3+2)=dat(i*16+15);
        rtvBoys(i*3+3)=dat(i*16+16);
        
    else
        
        numGirls=numGirls+1;
        ageGirls(i*3+1)=dat(i*16+2);
        ageGirls(i*3+2)=dat(i*16+3);
        ageGirls(i*3+3)=dat(i*16+4);
        ernGirls(i*3+1)=dat(i*16+5);
        ernGirls(i*3+2)=dat(i*16+6);
        ernGirls(i*3+3)=dat(i*16+7);
        aveStrGirls(i*3+1)=dat(i*16+8);
        aveStrGirls(i*3+2)=dat(i*16+9);
        aveStrGirls(i*3+3)=dat(i*16+10);
        sigConGirls(i*3+1)=dat(i*16+11);
        sigConGirls(i*3+2)=dat(i*16+12);
        sigConGirls(i*3+3)=dat(i*16+13);
        rtvGirls(i*3+1)=dat(i*16+14);
        rtvGirls(i*3+2)=dat(i*16+15);
        rtvGirls(i*3+3)=dat(i*16+16);
        
    end
    
end

figure(1);
scatter(ageBoys,ernBoys,'r');
hold on;
scatter(ageGirls,ernGirls,'b');
hold on;
line([-1000 1000], [-1006*slopeERN+intERN 994*slopeERN+intERN],'Color','k','LineWidth',3);
hold on;
line
xlabel('Age');
ylabel('ERN Amplitude (\muV)');
axis([5 10 -3.5 .25]);
hold off;

figure(2);
scatter(ageBoys,aveStrBoys,'r');
hold on;
scatter(ageGirls,aveStrGirls,'b');
hold on;
line([-1000 1000], [-1006*slopeAveStr+intAveStr 994*slopeAveStr+intAveStr],'Color','k','LineWidth',3);
hold on;
line
xlabel('Age');
ylabel('Average Signal Strength (\muV^2/ms)');
axis([5 10 30 36.5]);
hold off;

figure(3);
scatter(ageBoys,sigConBoys,'r');
hold on;
line([-1000 1000], [-1006*(slopeSTC+genAgeSTC)+genSTC+intSTC 994*(slopeSTC+genAgeSTC)+genSTC+intSTC],'Color','r','LineWidth',3);
hold on;
scatter(ageGirls,sigConGirls,'b');
hold on;
line([-1000 1000], [-1006*(slopeSTC-genAgeSTC)-genSTC+intSTC 994*(slopeSTC-genAgeSTC)-genSTC+intSTC],'Color','b','LineWidth',3);
hold on;
line
xlabel('Age');
ylabel('Average Signal Strength (d.u.)');
axis([5 10 -2.8 -.2]);
hold off;

figure(4);
scatter(ageBoys,rtvBoys,'r');
hold on;
line([-1000 1000], [-1006*(slopeRTV+genAgeRTV)+genRTV+intRTV 994*(slopeRTV+genAgeRTV)+genRTV+intRTV],'Color','r','LineWidth',3);
hold on;
scatter(ageGirls,rtvGirls,'b');
hold on;
line([-1000 1000], [-1006*(slopeRTV-genAgeRTV)-genRTV+intRTV 994*(slopeRTV-genAgeRTV)-genRTV+intRTV],'Color','b','LineWidth',3);
hold on;
line
xlabel('Age');
ylabel('Average Signal Strength (ms)');
axis([5 10 250 650]);
hold off;

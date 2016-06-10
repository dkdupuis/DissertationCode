function plotPredOut()

b1=-1.616;
m1=-0.1164;
b2=33.3986;
m2=-0.2149;
b3=-1.7294;
m3=0.1063;
b4=518.73;
m4=-40.7257;


datFile=fopen('C:\Users\dud164\Desktop\predOutput3Assessments.txt');
dat= fscanf(datFile, '%f');
fclose(datFile);

numParts=length(dat)/8;

dat(1)
dat(2)
x=6:.01:8.5;
figure(5);
for i=0:1:numParts-1
    
    plot(x,(m1+dat(i*8+2))*x+(b1+dat(i*8+1)),'Color',[rand() rand() rand()])
    hold on;
    
end
hold off;
xlabel('Age');
ylabel('ERN Amplitude');


figure(6);
for i=0:1:numParts-1
    
    plot(x,(m2+dat(i*8+4))*x+(b2+dat(i*8+3)),'Color',[rand() rand() rand()])
    hold on;
    
end
hold off;
xlabel('Age');
ylabel('Average Signal Strength');


figure(7);
for i=0:1:numParts-1
    
    plot(x,(m3+dat(i*8+6))*x+(b3+dat(i*8+5)),'Color',[rand() rand() rand()])
    hold on;
    
end
hold off;
xlabel('Age');
ylabel('Signal Temporal Consistency');


figure(8);
for i=0:1:numParts-1
    
    plot(x,(m4+dat(i*8+8))*x+(b4+dat(i*8+7)),'Color',[rand() rand() rand()])
    hold on;
    
end
hold off;
xlabel('Age');
ylabel('Behavioral Variability');


datFile=fopen('C:\Users\dud164\Desktop\predOutputFinal.txt');
dat= fscanf(datFile, '%f');
fclose(datFile);

numParts=length(dat)/8;

dat(1)
dat(2)
x=6:.01:8.5;

for i=0:1:numParts-1
    
    ernInt(i+1)=dat(i*8+1);
    ernSlope(i+1)=dat(i*8+2);
    powerInt(i+1)=dat(i*8+3);
    powerSlope(i+1)=dat(i*8+4);
    coherInt(i+1)=dat(i*8+5);
    coherSlope(i+1)=dat(i*8+6);
    rtvInt(i+1)=dat(i*8+7);
    rtvSlope(i+1)=dat(i*8+8);
    %plot(x,(m1+dat(i*8+2))*x+(b1+dat(i*8+1)),'Color',[rand() rand() rand()])
    %hold on;
    
end
% figure(1);
% scatter(ernInt,powerInt,'k');
% xlabel('ERN Amplitude Intercept');
% ylabel('Average Signal Strength Intercept');
% 
% figure(2);
% scatter(ernInt,coherInt,'k');
% xlabel('ERN Amplitude Intercept');
% ylabel('Signal Temporal Consistency Intercept');
% 
% figure(4);
% scatter(ernSlope,powerSlope,'k');
% xlabel('ERN Amplitude Slope');
% ylabel('Average Signal Strength Slope');

% figure(5);
% scatter(ernSlope,coherSlope,'k');
% xlabel('ERN Amplitude Slope');
% ylabel('Signal Temporal Consistency Slope');
% figure(3);
% 
% figure(6);
% scatter(powerInt,rtvInt,'k');
% xlabel('Average Signal Strength Intercept');
% ylabel('Behavioral Variability Intercept');
% axis([-2.2 2.2 -80 80])
% 
% figure(7);
% scatter(powerSlope,rtvSlope,'k');
% xlabel('Average Signal Strength Slope');
% ylabel('Behavioral Variability Slope');
% axis([-.15 .15 -35 35])
% 
% figure(8);
% scatter(coherInt,rtvInt,'k');
% xlabel('Signal Temporal Consistency Intercept');
% ylabel('Behavioral Variability Intercept');
% axis([-.13 .13 -80 80])
% 
% figure(9);
% scatter(coherSlope,rtvSlope,'k');
% xlabel('Signal Temporal Consistency Slope');
% ylabel('Behavioral Variability Slope');
% axis([-.13 .13 -35 35])

figure(10);
scatter(ernInt,rtvInt,'k');
hold on;
line([-1 1], [-.26*(24.135/.1422) .26*(24.135/.1422)],'Color','k');
xlabel('ERN Amplitude Estimated Intercepts');
ylabel('Behavioral Variability Estimated Intercepts');
axis([-.5 .5 -80 80])
% std(ernInt)
% std(rtvInt)
% std(ernSlope)
% std(rtvSlope)

figure(11);
scatter(ernSlope,rtvSlope,'k');
hold on;
line([-1 1], [-.28*(10.1944/.08646) .28*(10.1944/.08646)],'Color','k');
xlabel('ERN Amplitude Estimated Slopes');
ylabel('Behavioral Variability Estimated Slopes');
axis([-.32 .32 -35 35])




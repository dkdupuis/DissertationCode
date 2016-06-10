function simulatedSpectralPower()
%%includes Spectral Leakage Graph
iT=-.798828125;
dT=1.953125/1000;
T=.8;
t=iT:dT:T;

dF=.05;
F=10;
f=1:dF:F;

sig=zeros(length(f),length(t));

for i=1:1:length(f);
    
    sig(i,:)=sin(2*pi*f(i)*t);

end



iT2=-.798828125;
dT2=1.953125/1000;

f2=6;
t2=iT2+51*dT2:dT2:iT2+768*dT2;    %iT+768*dT;
alpha=4.7;

%sigmaF=f/alpha;
%sigmaT=1/(2*pi*sigmaF);
sigmaT=1./(2*pi*(f2/alpha));
phi_T=zeros(length(t2),1);

for tee=1:1:length(t2)
    %for eff=1:10
       
        phi_T(tee)=(1/(sqrt(pi)*sigmaT))*exp((-t2(tee)*t2(tee))/(2*sigmaT*sigmaT))*(exp(sqrt(-1)*2*pi*6*t2(tee))-exp((-alpha*alpha)/2));
        
    %end
end

dat=zeros(length(f),length(t)-length(t2)+1);

for i=1:1:length(f);
    dat(i,:)=conv(sig(i,:),phi_T(:,1),'valid');
end


%power=zeros(length(f),1);
power=(real(dat(:,52)).*real(dat(:,52))+imag(dat(:,52)).*imag(dat(:,52))).^(1/2);

figure;
plot(f,power);


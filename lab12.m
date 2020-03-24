clear all
clc
%Shannon capacity
snr=0;
for i = 1:10
snr = snr +2;
c=(log(1+10^(snr/10)))/log(2);
x(i)=snr;
y(i)=c;
end
figure
plot(x,y,'-','LineWidth',1.5)
hold on
% capacity of MIMO Link with NR=2, NT=2
NR=2;
rand('state',456321)
snr=0;
for i=1:10;
snr=snr+2;
for j=1:10000; c(j)=(NR*log(1+(10^(snr/10))*abs(normrnd(0,1)))/log(2)); end
yy(i)=mean(c);
xx(i)=snr;
end
plot(xx,yy,':','LineWidth',1.5)
% capacity of MIMO Link with NR=3, NT=3
NR=3;
rand('state',456321)
snr=0;
for i=1:10;
snr=snr+2;
for j=1:10000; c(j)=(NR*log(1+(10^(snr/10))*abs(normrnd(0,1)))/log(2)); end
yy(i)=mean(c);
xx(i)=snr;
end
plot(xx,yy,'-.','LineWidth',1.5)
% capacity of MIMO Link with NR=4, NT=4
NR=4;
rand('state',456321)
snr=0;
for i=1:10;
snr=snr+2;
for j=1:10000; c(j)=(NR*log(1+(10^(snr/10))*abs(normrnd(0,1)))/log(2)); end
yy(i)=mean(c);
xx(i)=snr;
end
plot(xx,yy,'--','LineWidth',1.5)
xlabel('SNR(dB)')
ylabel('Capacity (bit/s/Hz)')
grid on
legend('Shannon Capacity','MIMO, NT=NR=2','MIMO, NT=NR=3','MIMO, NT=NR=4',2)
title('MIMO Capacity')
print -deps -tiff -r300 capmimo
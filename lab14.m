% Free Space Propagation Loss
clc;
close all;
clear all;
f = [1000 2000 3000];
c = 300;
d = 1:1:10000;
Lp1 =20*log10((4*pi*d*f(1))/c);
Lp2 =20*log10((4*pi*d*f(2))/c);
Lp3 =20*log10((4*pi*d*f(3))/c);
figure(1);
plot(d,Lp1,'b',d,Lp2,'r',d,Lp3,'g');
xlabel('x--> D (distance in Meter)'); ylabel('y--> Lp (path loss in dB)');
title('Free space model');
hold on;
legend('f=1000MHz' , 'f=2000MHz' , 'f=3000 MHz'); grid on;
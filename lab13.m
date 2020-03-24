% Rayleigh fading pdf plot MATLAB code:
sig=1; %RMS value of received voltage signal
r = 0:0.01:10; %the range of value of 'r'
pdf=(r/sig.^2) .* exp(-r.^2/2*(sig.^2)); % the Rayleigh PDF figure; plot(r,pdf,'b') %Plotting the Rayleigh PDF
title('Rayleigh PDF Plot');
grid on;
xlabel('r');
ylabel('pdf');
%% 

% Rician fading pdf plot MATLAB code:
r=0:0.01:10;
v=5;
I0=0.55;
sig = 2; %the range of value of 'r'
pdf=(r./sig.^2) .* exp(-r.^2+v.^2./2*(sig.^2)).*I0.*(r.*v./(sig.^2)); % the rician PDF
figure;
plot(r,pdf,'b') %Plotting the rician PDF
title('Rician PDF Plot');
xlabel('r');
ylabel('pdf');
grid on;
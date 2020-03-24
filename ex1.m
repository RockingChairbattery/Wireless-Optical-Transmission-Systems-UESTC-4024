% ex1
M=32; % size of signal constellation--change1
k=log2(M); %number of bits per symbol
n=3e4; %number of bits to process
nsamp=1; %oversampling rate

x=randi([0 1],[n 1]); %random binary data stream
figure
stem(x(1:80),'filled');%--change2
title('Random Bits');
xlabel('Bit index');ylabel('Binary value');

% bit-to-symbol mapping
xsym=bi2de(reshape(x,k,length(x)/k).','left-msb');
figure
stem(xsym(1:10));
title('Random Symbols');
xlabel('Symbol index');ylabel('Integer value');

% modulation
y=modulate(modem.qammod(M),xsym);

% transmitted signal 
ytx=y;
EbNo=10; % in dB %--chang3
snr=EbNo+10*log10(k)-10*log10(nsamp);
ynoisy=awgn(ytx,snr,'measured');
yrx=ynoisy;

% scatter polt
h=scatterplot(yrx(1:nsamp*5e3),nsamp,0,'g.');
hold on;
scatterplot(ytx(1:5e3),1,0,'k*',h);
title('Received Signal');
legend('received signal','signal constellation')
axis([-5 5 -5 5]);
xlabel('In-Phase');ylabel('Quadrature');

%demodulation
zsym=demodulate(modem.qamdemod(M),yrx);

% symbol-to-bit mapping
z=de2bi(zsym,'left-msb');
z=reshape(z.',numel(z),1);

% BER computation
[number_of_errors, bit_error_rate]=biterr(x,z)

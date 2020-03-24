function [ber, numBits] = my_commdoc_bertool(EbNo, maxNumErrs, maxNumBits)
%BERTOOLTEMPLATE Template for a BERTool simulation function.
%   This file is a template for a BERTool-compatible
%   simulation function.  To use the template, insert your
%   own code in the places marked "INSERT YOUR CODE HERE"
%   and save the result as a file on your MATLAB path.
%   Then use the Monte Carlo panel of BERTool to execute
%   the script.
%
%   For more information about this template and an example
%   that uses it, see the Communications System Toolbox documentation.
%
%   See also BERTOOL, VITERBISIM.

% Copyright 1996-2010 The MathWorks, Inc.

% Import Java class for BERTool.
import com.mathworks.toolbox.comm.BERTool;

% Initialize variables related to exit criteria.
totErr  = 0; % Number of errors observed
numBits = 0; % Number of bits processed

%% Setup
% Define parameters.
M = 32;                       % Size of signal constellation
k = log2(M);                 % Number of bits per symbol
n = 1000;                    % Number of bits to process
nSamp = 1; 

% Simulate until number of errors exceeds maxNumErrs
% or number of bits processed exceeds maxNumBits.
while((totErr < maxNumErrs) && (numBits < maxNumBits))

   % Check if the user clicked the Stop button of BERTool.
   if (BERTool.getSimulationStop)
      break;
   end

%% Create Modulator and Demodulator
hMod = modem.qammod(M);         % Create a 16-QAM modulator
hMod.InputType = 'Bit';         % Accept bits as inputs
hMod.SymbolOrder = 'Gray';      % Accept bits as inputs
hDemod = modem.qamdemod(hMod);  % Create a 16-QAM based on the modulator

%% Signal Source
% Create a binary data stream as a column vector.
x = randi([0 1],n,1); % Random binary data stream

%% Modulation
% Modulate using 16-QAM.
y = modulate(hMod,x);

%% Transmitted Signal
yTx = y;

%% Channel
% Send signal over an AWGN channel.
% EbNo = 15; % In dB
SNR = EbNo + 10*log10(k) - 10*log10(nSamp);
yNoisy = awgn(yTx,SNR,'measured');

%% Received Signal
yRx = yNoisy;

%% Demodulation
% Demodulate signal using 16-QAM.
z = demodulate(hDemod,yRx);

%% BER Computation
% Compare x and z to obtain the number of errors and
% the bit error rate.
[number_of_errors,bit_error_rate] = biterr(x,z);

%% Update totErr and numBits.
totErr = totErr + number_of_errors;
numBits = numBits + n;

end % End of loop

% Compute the BER.
ber = totErr/numBits;
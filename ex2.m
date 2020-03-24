%%ex2
hMod=modem.pskmod('M',8,'phaseOffset',pi/4);%--change1

Rup=32;%--change2 %upsampling rate
hFilDesign=fdesign.pulseshaping(Rup,'Raised Cosine','Nsym,Beta',Rup,0.5);
hFil=design(hFilDesign);

d=randi([0 hMod.M-1],100,1);
sym=modulate(hMod,d);
xmt=filter(hFil,upsample(sym,Rup));

hScope=commscope.ScatterPlot;
hScope.SamplesPerSymbol=Rup;

hScope.Constellation=hMod.Constellation;

groupDelay=(hFilDesign.NumberOfSymbols/2);
hScope.MeasurementDelay=groupDelay/hScope.SymbolRate;

update(hScope,xmt)
hScope.PlotSettings.Constellation='on';

hFil.Numerator=hFil.Numerator/max(hFil.Numerator);

xmt=filter(hFil,upsample(sym,Rup));

reset(hScope)
update(hScope,xmt)

hScop.PlotSettings.SignalTrajectory='on';
hScope.PlotSettings.SignalTrajectoryStyle = ':m';

autoscale(hScope)

rcv = awgn(xmt, 20, 'measured'); % Add AWGN

reset(hScope) 
update(hScope, rcv)

hScope.PlotSettings.SignalTrajectory = 'off';

hScope.PlotSettings.Constellation = 'on';
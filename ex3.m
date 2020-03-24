%%ex3
M = 4;
x = [0:M-1];
inphase = [1/2 1 0 1/(2^(1/2))];
quadr = [0 0 1/2 1/(2^(1/2))];
inphase = [inphase; -inphase]; inphase = inphase(:);
quadr = [quadr; -quadr]; quadr = quadr(:);
const = inphase + j*quadr;
% Plot constellation.
scatterplot(const, 1, 0, '*');
hold on;
% circle=rectangle('Position',[-1,-1,2,2],'Curvature',[1,1]);
axis([-2 2 -2 2]);
title('Customised Constellation');
hold off;

M = 8;
x = [0:M-1];
inphase = [1 2 3 0 -2 0 2 0];
quadr = [0 0 0 1 2 2 2 3];
inphase = [inphase; -inphase]; inphase = inphase(:);
quadr = [quadr; -quadr]; quadr = quadr(:);
const = inphase + j*quadr;
% Plot constellation.
scatterplot(const, 1, 0, '*');
hold on;
% circle=rectangle('Position',[-1,-1,2,2],'Curvature',[1,1]);
axis([-4 4 -4 4]);
title('Customised Constellation');
hold off;
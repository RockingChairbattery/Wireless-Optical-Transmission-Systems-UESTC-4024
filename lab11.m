x_hexagon=[-1 -0.5 0.5 1 0.5 -0.5 -1];
y_hexagon=[0 -sqrt(3)/2 -sqrt(3)/2 0 sqrt(3)/2 sqrt(3)/2 0];
N=10; M=10;
figure(1)
hold on
for nn=0:N
    for mm=0:M
        plot(x_hexagon+3*nn,y_hexagon+sqrt(3)*mm)
    end
end
for nn=0:N-1
    for mm=0:M-1
        plot(x_hexagon+1.5+3*nn,y_hexagon+sqrt(3)/2+sqrt(3)*mm)
    end
end
hold off
axis equal
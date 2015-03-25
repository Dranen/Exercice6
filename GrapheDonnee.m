figure
[axd,p1d,p2d] = plotyy(x1,rholib,x1,epsilonr);
grid on;
xlabel('x [m]', 'FontSize', 20);
ylabel(ax(1),'\rho_lib [C.m^{-3}]');
ylabel(ax(2),'\epsilon_r');
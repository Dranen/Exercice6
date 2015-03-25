figure
[axd,p1d,p2d] = plotyy(x1,rholib,x1,epsilonr);
grid on;
xlabel('x [m]', 'FontSize', 20);
ylabel(axd(1),'\rho_lib [C.m^{-3}]');
ylabel(axd(2),'\epsilon_r');
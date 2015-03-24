figure
plot(1./N.^2,conv_rhopol);
grid on;
xlabel('N^{-2}', 'FontSize', 20);
ylabel('$\rho_{polarisation}$ [C.m$^{-3}$]', 'Interpreter', 'latex', 'FontSize', 20);

figure
plot(1./N,conv_rhopol);
grid on;
xlabel('N^{-1}', 'FontSize', 20);
ylabel('$\rho_{polarisation}$ [C.m$^{-3}$]', 'Interpreter', 'latex', 'FontSize', 20);

figure
plot(log10(1./N.^2),log10(abs(conv_rhopol)));
grid on;
xlabel('log(N^{-2})', 'FontSize', 20);
ylabel('$\log(\rho_{polarisation})$ [C.m$^{-3}$]', 'Interpreter', 'latex', 'FontSize', 20);

figure
plot(log10(1./N),log10(abs(conv_rhopol)));
grid on;
xlabel('log(N^{-1})', 'FontSize', 20);
ylabel('$\log(\rho_{polarisation})$ [C.m$^{-3}$]', 'Interpreter', 'latex', 'FontSize', 20);

figure
plot(N,conv_rhopol);
grid on;
xlabel('N', 'FontSize', 20);
ylabel('$\rho_{polarisation}$ [C.m$^{-3}$]', 'Interpreter', 'latex', 'FontSize', 20);

figure
loglog(N,conv_rhopol);
grid on;
xlabel('N', 'FontSize', 20);
ylabel('$\rho_{polarisation}$ [C.m$^{-3}$]', 'Interpreter', 'latex', 'FontSize', 20);
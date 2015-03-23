figure
plot(1./N.^2,conv_Ex);
grid on;
xlabel('N^{-2}', 'FontSize', 20);
ylabel('E_x [V/m]', 'FontSize', 20);

figure
plot(1./N,conv_Ex);
grid on;
xlabel('N^{-1}', 'FontSize', 20);
ylabel('E_x [V/m]', 'FontSize', 20);

figure
plot(N,conv_Ex);
grid on;
xlabel('N', 'FontSize', 20);
ylabel('E_x [V/m]', 'FontSize', 20);

figure
loglog(N,conv_Ex);
grid on;
xlabel('N', 'FontSize', 20);
ylabel('E_x [V/m]', 'FontSize', 20);
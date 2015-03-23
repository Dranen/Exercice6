figure
plot(1./N.^2,conv_phi);
grid on;
xlabel('N^{-2}', 'FontSize', 20);
ylabel('\phi [V]', 'FontSize', 20);

figure
plot(1./N,conv_phi);
grid on;
xlabel('N^{-1}', 'FontSize', 20);
ylabel('\phi [V]', 'FontSize', 20);

figure
plot(N,conv_phi);
grid on;
xlabel('N', 'FontSize', 20);
ylabel('\phi [V]', 'FontSize', 20);

figure
loglog(N,conv_phi);
grid on;
xlabel('N', 'FontSize', 20);
ylabel('\phi [V]', 'FontSize', 20);
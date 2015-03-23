figure
plot(x3,rhocmp-dDx);
grid on;
xlabel('x [m]', 'FontSize', 20);
ylabel('$\frac{1}{\epsilon_0}\left(\rho_{lib} - \frac{dDx}{dx}\right)$ [V.m$^{-2}$]', 'Interpreter', 'latex', 'FontSize', 22);
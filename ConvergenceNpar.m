clear all;
N = [25:25:10000];
xb = 0.01;

parfor i = 1:max(size(N))
    N2 = 2*N(i);
    N1 = N(i);
    conv_phi(i) = ConvergenceNparf(N1,N2,xb);
end

Grapheconvphi;

fprintf('\n');
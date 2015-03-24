clear all;
N = [25:1:249 250:10:490 500:25:10000];
xb = 0.01;

parfor i = 1:max(size(N))
    N2 = 2*N(i);
    N1 = N(i)
    a = ConvergenceNparf(N1,N2,xb);
    conv_phi(i) = a(1);
    conv_Ex(i) = a(2);
    conv_rhopol(i) = a(3);
end

Grapheconvphi;
GrapheconvEx;
Grapheconvrhopol;

fprintf('\n');
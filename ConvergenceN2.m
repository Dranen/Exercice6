N = [40 50:50:1000];
N1 = 50;
trivial = 0;
output_file = 'out.dat';
input_file = 'inp.dat';
xb = 0.01;

for i = 1:max(size(N))
    N2 = N(i);
    Simulation;
    Lecture_sortie;
    j = 1;
    while(j < max(size(x1)) && x1(j)~= xb)
        j = j+1;
    end
    conv_phi(i) = phi(j);
end

Grapheconvphi;

fprintf('\n');
clear all;
N = [50:50:1000];
N2 = 40;
trivial = 0;
p=0.5;
output_file = 'out.dat';
input_file = 'inp.dat';
xb = 0.01;

for i = 1:max(size(N))
    N1 = N(i);
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

Suppression_fichier_sortie;
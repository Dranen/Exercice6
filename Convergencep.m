clear all;
p_ = [0:0.01:1];
trivial = 0;
N2 = 5;
N1 = 5;
output_file = 'out.dat';
input_file = 'inp.dat';
xb = 0.01;

for i = 1:max(size(p_))
    p = p_(i);
    Simulation;
    Lecture_sortie;
    j = 1;
    while(j < max(size(x1)) && x1(j)~= xb)
        j = j+1;
    end
    conv_phi(i) = phi(j);
end

Grapheconvphi_p;

fprintf('\n');
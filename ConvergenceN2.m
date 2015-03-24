clear all;
N = [40 50:50:1000];
N1 = 50;
trivial = 0;
p=0.5;
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
    
    j = 1;
    while(j < max(size(x2)) && x2(j) < xb*0.5)
        j = j+1;
    end
    j=j-1;
    conv_Ex(i) = Ex(j)*(1-(xb*0.5-x2(j))/(x2(j+1)-x2(j)))+Ex(j+1)*(1-(x2(j+1)-xb*0.5)/(x2(j+1)-x2(j)));
    
    conv_rhopol(i) = min(rhopol);
    
end

Grapheconvphi;
GrapheconvEx;
Grapheconvrhopol;

fprintf('\n');

Suppression_fichier_sortie;
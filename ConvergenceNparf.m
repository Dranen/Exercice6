function val = ConvergenceNparf(N1,N2,xb)
    output_file = ['out' num2str(N1) '.dat'];
    input_file = ['inp' num2str(N1) '.dat'];
    trivial = 0;
    p = 0;
    
    Simulation;
    Lecture_sortie;
    
    j = 1;
    while(j < max(size(x1)) && x1(j)~= xb)
        j = j+1;
    end
    val(1) = phi(j);
    
    j = 1;
    while(j < max(size(x2)) && x2(j) < xb*0.5)
        j = j+1;
    end
    j=j-1;
    val(2) = Ex(j)*(1-(xb*0.5-x2(j))/(x2(j+1)-x2(j)))+Ex(j+1)*(1-(x2(j+1)-xb*0.5)/(x2(j+1)-x2(j)));
    
    val(3) = max(rhopol);
    
    delete(input_file);
    delete(['phi_' output_file]);
    delete(['rhocmp_' output_file]);
    delete(['Ex_' output_file]);
    delete(['rhopol_' output_file]);
end
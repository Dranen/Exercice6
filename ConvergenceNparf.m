function val = ConvergenceNparf(N1,N2,xb)
    output_file = ['out' num2str(N1) '.dat'];
    input_file = ['inp' num2str(N1) '.dat'];
    trivial = 0;
    p = 0.5;
    Simulation;
    Lecture_sortie;
    j = 1;
    while(j < max(size(x1)) && x1(j)~= xb)
        j = j+1;
    end
    
    val = phi(j);
    delete(input_file);
    delete(['phi_' output_file]);
    delete(['rhocmp_' output_file]);
    delete(['Ex_' output_file]);
    delete(['rhopol_' output_file]);
end
out = load(['phi_' output_file]);
x1 = out(:,1);
phi = out(:,2);
out = load(['Ex_' output_file]);
x2 = out(:,1);
Ex = out(:,2);
Dx = out(:,3);
out = load(['rhocmp_' output_file]);
x3 = out(:,1);
rhocmp = out(:,2);
dDx = out(:,3);
out = load(['rhopol_' output_file]);
x4 = out(:,1);
rhopol = out(:,2);

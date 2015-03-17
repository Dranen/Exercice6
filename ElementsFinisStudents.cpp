#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cmath>

using namespace std;

// declaration of function triangular_solve which is used to resolve the system of linear equations here
template <class T>
void triangular_solve(const std::vector<T>& diag,
            const std::vector<T>& lower,
            const std::vector<T>& upper,
            const std::vector<T>& rhs,
            std::vector<T>& solution)
{

  std::vector<T> new_diag=diag;
  std::vector<T> new_rhs=rhs;
  
  // forward elimination
  for(unsigned int i=1;i<diag.size();++i) {
    double pivot=lower[i-1]/new_diag[i-1];
    new_diag[i]-=pivot*upper[i-1];
    new_rhs[i]-=pivot*new_rhs[i-1];
  }
  
  solution.resize(diag.size());
  
  // solve last equation
  solution[diag.size()-1]=new_rhs[diag.size()-1]/new_diag[diag.size()-1];
  
  // back substitution
  for(int i=diag.size()-2;i>=0;--i)
    solution[i]=(new_rhs[i]-upper[i]*solution[i+1])/new_diag[i];
}


// functionclass for epsilon_r
class Epsilonr {
public:
  Epsilonr(bool trivial,double b,double c) : b(b),c(c),trivial(trivial) {};
  
  inline double operator()(double x) {
          if(trivial or x<b)
            return 1.0;
    
          return 2.0+5.0*(x-b)/(c-b);      
   }
  
private:
  double c,b;
        bool trivial;
};

// functionclass for rho_lib/epsilon_0
class Rho_lib {
public:
  Rho_lib(bool trivial,double a0,double x0,double sigma) 
    : a0_(a0),x0_(x0),sigma2_(sigma*sigma),trivial(trivial) {};
  
  inline double operator()(double x) {
    if(trivial)
            return 0.;
          
          return a0_*exp(-(x-x0_)*(x-x0_)/(2*sigma2_));
  }
  
private:
    double a0_,x0_,sigma2_;
        bool trivial;
};

int main(int argc,char* argv[]) {
  
  
  const double xa=0;
  const double xb=0.01;
        const double xc=0.03;
  
        const double L1=xb-xa;
        const double L2=xc-xb;
        const double L=L1+L2;
        
  const double V_a=0;
  const double V_c=5;

  const double p = 0.5;
  
  const double a0=70000.0;
  const double x0=L1/2;
  const double sigma=0.1*L1;

  const double epsilon0 = 8.85418782e-12;
  
        int trivial;
        cerr << "trivial case 1 (question 6.2.c) ou 0 (questions suivantes): " <<flush;
        cin  >> trivial;
        
        
        // initialize function object for epsilon_r
        Epsilonr epsilonr(trivial>0,xb,xc);
        
  // initialize function object for rho_lib
  Rho_lib rho_lib(trivial>0,a0,x0,sigma);

  int ninter1,npoints1,ninter2,npoints2;
  cerr << "nombre d'intervalles N1: " <<flush;
  cin  >> ninter1;
  npoints1=ninter1+1;
        cerr << "nombre d'intervalles N2: " <<flush;
        cin  >> ninter2;
        npoints2=ninter2+1;
        
  int ninter=ninter1+ninter2;
        int npoints=ninter+1;
        
  std::string output_filename;     
  cerr << "Nom du fichier de sortie: " <<flush;
  cin  >> output_filename;
  
  vector<double> x(npoints);
  
  // piecewise regular grid
  double hreg1=L1/((double)ninter1);
        double hreg2=L2/((double)ninter2);
  
  for(int i=0;i<npoints1;++i){
    x[i]=xa+hreg1*((double)i);
        }
        
        for(int i=npoints1;i<npoints;++i){
                x[i]=xb+hreg2*((double)(1+i-npoints1));
        }
  
  std::vector<double> h(ninter);
  for(int i=0;i<ninter;++i)
    h[i]=x[i+1]-x[i];
  
  // the vectors representing the matrix
  
  std::vector<double> d(npoints,0.);  // main diagonal
  std::vector<double> a(ninter,0.);   // lower diagonal
  std::vector<double> c(ninter,0.);   // upper diagonal
  std::vector<double> b(npoints,0.);  // right hand side

  d[0] = 1;
  b[0] = V_a;

  for(int i=1;i<ninter;++i)
  {
      d[i] = (p*0.5*(epsilonr(x[i-1])+epsilonr(x[i])) + (1-p)*epsilonr(x[i]-0.5*h[i-1]))/h[i-1] + (p*0.5*(epsilonr(x[i])+epsilonr(x[i+1])) + (1-p)*epsilonr(x[i]+0.5*h[i]))/h[i];
      c[i-1] = -(0.5*p*(epsilonr(x[i-1]+epsilonr(x[i]))) + (1-p)*epsilonr(x[i]-0.5*h[i-1]))/h[i-1];
      a[i-1] = -(0.5*p*(epsilonr(x[i-1]+epsilonr(x[i]))) + (1-p)*epsilonr(x[i]-0.5*h[i-1]))/h[i-1];
      b[i] = h[i-1]*(p*rho_lib(x[i])/(2.0*epsilon0) + (1-p)*rho_lib(x[i]-h[i-1]/2.0)/(2.0*epsilon0)) + h[i]*(p*rho_lib(x[i])/(2.0*epsilon0) + (1-p)*rho_lib(x[i]+h[i]/2.0)/(2.0*epsilon0));
  }

  c[0] = 0;
  c[ninter-1] = -(0.5*p*(epsilonr(x[ninter-1]+epsilonr(x[ninter]))) + (1-p)*epsilonr(x[ninter]-0.5*h[ninter-1]))/h[ninter-1];
  a[ninter-1] = 0;
  d[npoints-1] = 1;
  b[npoints-1] = V_c;
  
// Write some code here...
  
  std::vector<double> phi;
  
  // solve the triangular linear system, 
  // T gets correctly resized during the solution process
  triangular_solve(d,a,c,b,phi);
  
  //
  // calculate electric field Ex and displacement Dx/epsilon_0 at middle of intervals
  //
  
  std::vector<double> Ex(ninter);
  std::vector<double> Dx(ninter);
  std::vector<double> rhopol(ninter);

  for(int i=0;i<ninter;++i) {
    Ex[i] = -(phi[i+1]-phi[i])/h[i];
    Dx[i] = Ex[i]*epsilon0*epsilonr(x[i]);
    rhopol[i] = Ex[i]*epsilon0*(epsilonr(x[i])-1);
  }
  
  //
  //
  // write to output files
  //
  {
    ofstream ofs(("phi_"+output_filename).c_str());
    ofs.precision(15);

    for(int i=0;i<npoints;++i)
      ofs << x[i] << " " << phi[i] << endl;
  
    ofs.close();
  }

  {
    ofstream ofs(("Ex_"+output_filename).c_str());  
    ofs.precision(15);
    
    for(int i=0;i<ninter;++i)
      ofs << x[i]+h[i]/2. << " " << Ex[i] << " " << Dx[i] << endl;
    
    ofs.close();
  }

  // compute  dDx/dx with finite differences (Note: Dx[i] is defined at the middle of intervals)
  // but dDx/dx is defined at the middle point in-between middle of intervals ... which is NOT 
  // the edge of intervals, because the grid is not regular! 
  // The coordinate of this "middle of middle points" is stored in xmidmid

  std::vector<double> dDx(ninter-1);
  std::vector<double> rhocmp(ninter-1);
  std::vector<double> xmidmid(ninter-1);
  
  for(int i=0;i<ninter-1;++i) { 
    xmidmid[i] = (x[i] + x[i+2])*0.5;
    rhocmp[i]=rho_lib(xmidmid[i]);
    dDx[i]= (Dx[i+1]-Dx[i])/(0.5*(h[i+1]+h[i]));
  }
  {
    ofstream ofs(("rhocmp_"+output_filename).c_str());  
    ofs.precision(15);
    
    for(int i=0;i<ninter-1;++i)
      ofs << xmidmid[i] << " " << rhocmp[i] << " " << dDx[i] << endl;
    
    ofs.close();
  }

  {
    ofstream ofs(("rhopol_"+output_filename).c_str());
    ofs.precision(15);

    for(int i=0;i<ninter;++i)
      ofs << x[i]+h[i]/2.0 << " " << rhopol[i] << endl;

    ofs.close();
  }


  
  return 0;
}


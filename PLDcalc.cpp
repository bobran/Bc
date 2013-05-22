#include "stdio.h"
#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

double e1[200][5], e2[200][5], Theta[200][2];

int load() {
    char soubor1[50]="ng517_interp.dat";
    const char soubor2[50]="STO_SM75.knt";
    double max;
    max=4.4;

    double x=0;
    int i=0;
    ifstream vstup(soubor1);
    ifstream vstup2(soubor2);
    do {
        vstup.precision(15);
    
        for (int j=0; j<5; j++) {
            vstup >> e1[i][j];
            vstup2>> e2[i][j];
        }
        cout.precision(15);
        //cout << Pr[i].lambda << "\t" << Pr[i].uhel << "\t" << Pr[i].otacky << endl;
        i++;
        //cout<<i<<"\t"<<e1[i-1][0]<<endl;
    } while (e1[i-1][0]<max);
    vstup.close();
    vstup2.close();
    return i-1;
}

int main() {
    int n,i;
    double beta, r0,r1,A,B,C,D,E,F,K,t1,s,c;
    ofstream vystup("PLD.dat", ios::out);
    n=load();
    t1=80.1e-9;
    for(i=0;i<n;i++){
        r0=(sqrt(e1[i][1])-1)/(sqrt(e1[i][1])+1);
        r1=(sqrt(e2[i][1])-sqrt(e1[i][1]))/(sqrt(e2[i][1])+sqrt(e1[i][1]));
        beta=t1*sqrt(e1[i][1])*(e1[i][0])/(3e8*6.58211899e-16);
        s=sin(2*beta);
        c=cos(2*beta);
        A=s+2*r1*r1*c*s-r1*r1*s+4*r1*c*beta;
        B=1-c+4*r1*s*beta+r1*r1*(c-c*c-s*s);
        C=r0+r1*c+r0*r0*t1*c+r0*r1*r1*c*c-r0*r1*r1*s*s;
        D=r1*s+2*r0*r1*r1*c*s+r0*r0*r1*s;
        //E=r0+r1*c+r0*r0*r1*c+r0*r1*r1*c*c-r0*r1*r1*s*s;
        //F=r1*s+2*r0*r1*r1*c*s+r0*r0*r1*s;
        K=e2[i][1]*(1-r0*r0)/(4*e1[i][1]);
        Theta[i][0]=K*(A*C+B*D)/(C*C+D*D);
        Theta[i][1]=K*(B*C-A*D)/(C*C+D*D);
        vystup.precision(10);
        vystup.width(12);
        vystup<<e1[i][0]<<"\t"<<Theta[i][0]<<"\t"<<Theta[i][1]<<endl;
    }
    vystup.close();
}

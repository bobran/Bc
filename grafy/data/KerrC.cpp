// KerrC.cpp : Defines the entry point for the console application.
//

#include "stdio.h"
#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;
typedef struct {
    double lambda,signal1,signal2,epsilon,sigma1,sigma2,E,y1,y2,w,Q,K,delta;
    int otacky1,otacky2;
} tData;
int N;
int zn1;
int zn2;
char soubor1[20];
char soubor2[20];
char soubor3[20];
const double h=1238.62;
const int n=1000;
bool elip;
double minimum=256;
tData Pr[n];
const double Pi=4*atan(1.0);
double power (double x, int k) {
    double x0=x;
    for (int i=2; i<=k; i++) {
        x0*=x;
    }
    return x0;
}
void nacti() {
    double x=0;
    int i=0;
    ifstream vstup(soubor1);
    do {
        vstup.precision(15);

        vstup >> Pr[i].lambda >> Pr[i].signal1 >> Pr[i].otacky1;
        for (int j=0; j<=7; j++) {
            vstup >> x;
        }
        cout.precision(15);
        //cout << Pr[i].lambda << "\t" << Pr[i].uhel << "\t" << Pr[i].otacky << endl;
        i++;
    } while (Pr[i-1].lambda>minimum);
    vstup.close();
    i=0;
    if (elip) {
        ifstream vstup2(soubor2);
        do {
            vstup2.precision(15);
            vstup2 >> Pr[i].lambda >> Pr[i].signal2 >> Pr[i].otacky2;
            for (int j=0; j<=7; j++) {
                vstup2 >> x;
            }
            cout.precision(15);
            //cout << Pe[i].lambda << "\t" << Pe[i].uhel << "\t" << Pe[i].otacky << endl;
            N=i;
            i++;
        } while (Pr[i-1].lambda>minimum);
        vstup2.close();
    }
}




int main()
{
    char o;
    do{
    cout<< "Minimalni vlnova delka:" << endl;
    cin>>minimum;
    cout<<"Chcete pocitat elipticitu? a/n"<<endl;
    cin>>o;
    if (o=='a') {
        elip=true;
    }else {
        elip=false;
    }
    cout<<"Soubor hodnot bez desticek:"<<endl;
    cin>>soubor1;
    cout<<"Znamenko otacek:(1/-1)"<<endl;
    cin>>zn1;
    if (elip) {
        cout<<"Soubor hodnot s destickami:"<< endl;
        cin>>soubor2;
        cout<<"Znamenko otacek:(1/-1)"<<endl;
        cin>>zn2;
    }
    cout<<"Vystupni soubor:"<<endl;
    cin>>soubor3;
    ofstream vystup(soubor3, ios::out);


    nacti();
    // const int N= sizeof(Pr)/sizeof(Pr[0]);
    for (int i=0; i<=N-1; i++) {
        Pr[i].E=h/Pr[i].lambda;
        Pr[i].y1=0.0415*power(Pr[i].E,3)-0.1602*power(Pr[i].E,2)+0.5519*Pr[i].E-0.3826;
        Pr[i].sigma1=Pr[i].signal1*Pr[i].y1*0.5+zn1*Pr[i].otacky1/(18.0);
        vystup.precision(10);
        vystup.width(12);
        vystup<<Pr[i].E<<"\t"<<Pr[i].sigma1;
        if (elip) {
            Pr[i].y2=0.0415*power(Pr[i].E,3)-0.1602*power(Pr[i].E,2)+0.5519*Pr[i].E-0.3826;
            Pr[i].sigma2=Pr[i].signal2*Pr[i].y2*0.5+zn2*Pr[i].otacky2/(18.0);
            Pr[i].K=power(Pr[i].lambda,2);
            Pr[i].w=1-(93.0665*93.0665)/Pr[i].K;
            Pr[i].Q=1/(power(Pr[i].w,2)*Pr[i].lambda*sqrt(1+136.24/Pr[i].w));
            Pr[i].delta=(Pr[i].Q*169508.75986+2.884488929)*Pi/180.0;
            Pr[i].epsilon=(-1)*((-1)*Pr[i].sigma2/sin(Pr[i].delta)+Pr[i].sigma1*(1/tan(Pr[i].delta)));
            vystup.precision(10);
            vystup.width(12);
            vystup<<"\t"<<Pr[i].epsilon;
        }
        vystup.precision(10);
        vystup.width(12);
        vystup<<endl;
        //cout<< Pe[i].delta << endl;
    }
    cout << "Hotovo. Opakovat? a/n";
    cin>>o;
    }while(o!='n');
    return 0;
}

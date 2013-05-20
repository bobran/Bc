reset
set xlabel "$E$/eV"
set ylabel ""
set key left top
A(x)=(1240/x)**2
w(x)=1-(93.0665**2)/A(x)
Q(x)=1/(((w(x))**2)*(1240/x)*sqrt(1+136.24/w(x)))
K(x)=(Q(x)*169508.75986+2.884488929)*pi/180.0
plot [1.4:5][] "< paste CoFeSi1-2.dat CoFeSi1-2e.dat" u 1:4 smooth bezier t "$\\theta_K$", "" u 1:(($8-$4*cos(K($1)))/sin(K($1))) smooth bezier t "$\\epsilon_K$"
set term epslatex
set output "CoFeSi1.tex"
replot
set term wxt
replot

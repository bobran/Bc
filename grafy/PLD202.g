reset
set xlabel "$E$/eV"
set ylabel ""
set key left top
A(x)=(1240/x)**2
w(x)=1-(93.0665**2)/A(x)
Q(x)=1/(((w(x))**2)*(1240/x)*sqrt(1+136.24/w(x)))
K(x)=(Q(x)*169508.75986+2.884488929)*pi/180.0
plot [1.4:5][] "< paste data/PLD202.dat data/PLD202e.dat" u 1:4 smooth bezier t "$\\theta^1_K$", "" u 1:(($8-$4*cos(K($1)))/sin(K($1))) smooth bezier t "$\\epsilon^1_K$", "data/pld202m.dat" u 1:2 t "$\\theta^2_K$" with lines, "" u 1:3 t "$\\epsilon^2_K$" with lines
set term epslatex
set output "PLD202.tex"
replot
set term wxt
replot

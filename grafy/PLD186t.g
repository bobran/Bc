reset
set xlabel "$E$ [eV]"
set ylabel "Polární Kerrův jev [deg.]"
set key left top
set zeroaxis
set style line 1 lt 1 lw 3 pt 3 linecolor rgb "red"
set style line 2 lt 2 lw 3 pt 3 linecolor rgb "red"
set style line 3 lt 1 lw 3 pt 3 linecolor rgb "blue"
set style line 4 lt 2 lw 3 pt 3 linecolor rgb "blue"
A(x)=(1240/x)**2
w(x)=1-(93.0665**2)/A(x)
Q(x)=1/(((w(x))**2)*(1240/x)*sqrt(1+136.24/w(x)))
K(x)=(Q(x)*169508.75986+2.884488929)*pi/180.0
plot [1.65:4.5][] "< paste data/PLD186_4.dat data/PLD186e.dat" u 1:4 smooth bezier t "$\\theta_K$" ls 1,\
"" u 1:(-1*($8-$4*cos(K($1)))/sin(K($1))) smooth bezier t "$\\epsilon_K$" ls 2,\
"data/pld186t.dat" u 1:2 t "$\\theta_K$" with lines ls 3,\
"" u 1:(-1*$3) t "$\\epsilon_K$" with lines ls 4
set term epslatex color
set output "PLD186t.tex"
replot
set term wxt
replot

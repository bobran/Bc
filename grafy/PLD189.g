reset
set xlabel "$E$/eV"
set ylabel "$\\theta_K$"
set key left top
K(x)=1
plot [1.4:5][-0.018:0.005] "PLD189.dat" u (1240/$1):4 smooth bezier t ""
set term epslatex
set output "PLD189.tex"
replot
set term wxt
replot

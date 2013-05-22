reset
set key top left
set xlabel "$E$/eV"
set ylabel "$\\theta_K$"
plot [1.4:5][-0.02:0.02] "X5.dat" u (1240/$1):4 t "40 měření", "X9.dat" u (1240/$1):4 t "200 měření"
set term epslatex
set output "TPE1.tex"
replot
set term wxt
replot

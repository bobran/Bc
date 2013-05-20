reset
set xlabel "$\\lambda$/nm"
set ylabel "$\\theta_K$"
plot [270:][-0.02:0.02] "X5.dat" u 1:4 t "80 měření", "X9.dat" u 1:4 t "320 měření"
set term epslatex
set output "TPE1.tex"
replot
set term wxt
replot

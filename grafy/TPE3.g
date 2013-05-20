reset
set xlabel "$\\lambda$/nm"
set ylabel "$\\theta_K$"
set key left top
plot [270:][-0.02:0.02] "PLD194-1.dat" u 1:4 t "80 mereni 1s", "PLD194-2.dat" u 1:4 t "160 mereni 2s", "PLD194-4.dat" u 1:4 t "320 mereni 5s"
set term epslatex
set output "TPE3.tex"
replot
set term wxt
replot

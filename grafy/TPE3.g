reset
set xlabel "$E$/eV"
set ylabel "$\\theta_K$"
set key left top
plot [1.4:5][-0.02:0.02] "PLD194-1.dat" u (1240/$1):4 t "40 mereni 1s", "PLD194-2.dat" u (1240/$1):4 t "120 mereni 2s", "PLD194-4.dat" u (1240/$1):4 t "240 mereni 5s"
set term epslatex
set output "TPE3.tex"
replot
set term wxt
replot

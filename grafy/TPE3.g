reset
set xlabel "$E$ [eV]"
set ylabel "$\\theta_K$ (a.u.)"
set key left top
set zeroaxis
set style line 1 lt 1 lw 3 pt 1 linecolor rgb "red"
set style line 2 lt 1 lw 3 pt 2 linecolor rgb "blue"
set style line 3 lt 1 lw 3 pt 3 linecolor rgb "green"
plot [1.4:5][-0.02:0.02] "PLD194-1.dat" u (1240/$1):4 t "40 mereni 1s" ls 1,\
"PLD194-2.dat" u (1240/$1):4 t "120 mereni 2s" ls 2,\
"PLD194-4.dat" u (1240/$1):4 t "240 mereni 5s" ls 3
set term epslatex
set output "TPE3.tex"
replot
set term wxt
replot

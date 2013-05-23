reset
set key top left
set xlabel "$E$ [eV]"
set ylabel "$\\theta_K$ (a.u.)"
set zeroaxis
set style line 1 lt 1 lw 3 pt 1 linecolor rgb "red"
set style line 2 lt 1 lw 3 pt 2 linecolor rgb "blue"
plot [1.4:5][-0.02:0.02] "X5.dat" u (1240/$1):4 t "40 měření" ls 1, "X9.dat" u (1240/$1):4 t "200 měření" ls 2
set term epslatex color
set output "TPE1.tex"
replot
set term wxt
replot

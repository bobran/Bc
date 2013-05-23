reset
set xlabel "$E$ [eV]"
set ylabel "$\\theta_K$ (a.u.)"
set zeroaxis
set style line 1 lt 1 lw 3 pt 1 linecolor rgb "red"
set style line 2 lt 1 lw 3 pt 2 linecolor rgb "blue"
plot [1.4:5][-0.02:0.02] "CoF-RT-Al100-1b.dat" u 1:4 t "1s" ls 1,\
"CoF-RT-Al100-2b.dat" u 1:4 t "5s" ls 2
set term epslatex
set output "TPE2.tex"
replot
set term wxt
replot

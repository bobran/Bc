reset
set xlabel "$E$/eV"
set ylabel "$\\theta_K$"
plot [1.4:5][-0.02:0.02] "CoF-RT-Al100-1b.dat" u 1:4 t "1s", "CoF-RT-Al100-2b.dat" u 1:4 t "5s"
set term epslatex
set output "TPE2.tex"
replot
set term wxt
replot

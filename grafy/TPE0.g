reset
set xlabel "$\\alpha$/$^o$"
set ylabel "$I$"
f1(x)=a1+b1*((sin(x*pi/180))**2+c1*sin(2*x*pi/180))
f2(x)=a2+b2*((sin(x*pi/180))**2+c2*sin(2*x*pi/180))
c1=0.020961
c2=0.032219
fit f1(x) "CoFeSi1-X.dat" u ($1/1000):2 via a1,b1,c1
fit f2(x) "CoFeSi1-X.dat" u ($1/1000):3 via a2,b2,c2
plot [][0:] "CoFeSi1-X.dat" u ($1/1000):2 t "$I=2$ A", "CoFeSi1-X.dat" u ($1/1000):3 t "$I=-2$ A", f1(x) t "", f2(x) t ""
set term epslatex
set output "TPE0.tex"
replot
set term wxt
replot

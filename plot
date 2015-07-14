set terminal postscript color
set logscale xy
set yrange [.5:50]
set xrange [1:50000]
set xlabel "Daily pedestrian volume"
set ylabel "Pedestrian injuries per intersection, 2003-2011"

# m               = 0.450392         +/- 0.012        (2.663%)
# b               = -2.10517         +/- 0.09925      (4.715%)

f(x) = m * x + b
fit exp(f(log(x))) "matched" using 2:6 via m, b

plot "matched" using 2:($6 + rand(0)) title "", exp(b) * (x ** m) lt 3 lw 5

# m               = -0.351389        +/- 0.03077      (8.757%)
# b               = -4.82427         +/- 0.1414       (2.931%)

fit exp(f(log(x))) "matched" using 2:($6 / ($2 * 9 * 365) * 1000) via m, b

set yrange [1e-05:.1]
set ylabel "Pedestrian injuries per 1000 crossings, 2003-2011"
plot "matched" using 2:(($6 + rand(0)) / ($2 * 9 * 365) * 1000) title "", exp(b) * (x ** m) lt 3 lw 5

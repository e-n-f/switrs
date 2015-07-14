set terminal postscript color
set logscale xy
set yrange [.5:50]
set xrange [1:50000]
set xlabel "Daily pedestrian volume"
set ylabel "Pedestrian injuries per intersection, 2003-2011"
plot "matched" using 2:($6 + rand(0)) title "", .0975 * x ** 0.478 lt 3 lw 5

set yrange [1e-05:.1]
set ylabel "Pedestrian injuries per 1000 crossings, 2003-2011"
plot "matched" using 2:(($6 + rand(0)) / ($2 * 9 * 365) * 1000) title "", .02968 * x ** -.522 lt 3 lw 5

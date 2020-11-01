#set terminal qt font "sans,10" 
set terminal qt size 800,600 enhanced font 'Segoe UI,10'
set encoding utf8

#definovani barvy os
set style line 80 linetype 1 linecolor "#808080" linewidth 2 
set border 3 back linestyle 80

#mrizka
set style line 81 lt 0
set style line 81 lt rgb "0x00D3D3D3"
set style line 81 lw 0.5
set grid back linestyle 81

set xtics nomirror
set ytics nomirror

set title "Měření teploty na Lysé hoře během dne" font "sans-Bold"
set xlabel "Čas [datum]"
set ylabel "Teplota [°C]"

set key bottom left Left title "Průběhy:" enhanced font "sans-Italic" #reverse box
set datafile separator ","
set key autotitle columnhead # use the first line as title
set xdata time
set timefmt "%b %d %Y"
set xtics border in scale 1,0.5 nomirror rotate by -45  offset character 0, 0, 0

#set xrange [ "Jul 01 2019":"Jul 31 2019" ]
set yrange [-20:35]

set style line 1 lt rgb "#A00000" lw 2 pt 1

#plot "data.txt" index 0 title "Outside" w lp ls 1, \
#"" index 1 title "Inside" with lines

plot "lysa02.csv" using 1:2 with lines, \
               '' using 1:3 with lines, \
               '' using 1:4 with lines, \
               '' using 1:3 smooth csplines title 'Aproximace průměrných teplot' with lines, \
               '' using 1:2 smooth acsplines title 'Aproximace maximálních teplot' with lines, \
               '' using 1:4 smooth mcsplines title 'Aproximace minimálních teplot' with lines                  

pause -1
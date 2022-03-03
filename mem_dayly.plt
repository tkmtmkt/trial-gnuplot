#
set terminal png
set output "mem_dayly.png"
set grid

file_name="mem_dayly.csv"
set datafile separator ","

set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M"

#set xtics timedate
set xtics format "%H:%M"
set xtics rotate by -60
set xtics 60 * 60

plot file_name using 1:4 title "%memused" with lines, \
     file_name using 1:8 title "%commit" with lines;

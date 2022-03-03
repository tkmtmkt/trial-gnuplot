#
set terminal png
set output "mem_monthly.png"
set grid

file_name="mem_monthly.csv"
set datafile separator ","

set xdata time
set timefmt "%Y-%m-%d"
set format x "%m/%d"

#set xtics timedate
set xtics format "%m/%d"
set xtics 60 * 60 * 24 * 7

plot file_name using 1:4 title "%memused" with lines, \
     file_name using 1:8 title "%commit" with lines;

# trial-gnuplot
Learn how to use gnuplot

### memory dayly

```sh
$ sadf -dt -- -r | cut -d ";" -f 3- | sed 's/;/,/g' > mem_dayly.csv
$ gnuplot mem.plt
```

### memory monthly

```sh
echo "timestamp,kbmemfree,kbmemused,%memused,kbbuffers,kbcached,kbcommit,%commit,kbactive,kbinact,kbdirty" > mem_monthly.csv
for SAD in $(ls -1tr /var/log/sa/sa[0-3][0-9])
do
  DATE=$(stat -c %y $SAD | awk '{print $1}')
  LANG=C sar -r -f $SAD | tail -1 | sed -e "s/Average:/$DATE/" -e 's/\s\+/,/g' >> mem_monthly.csv
done
```

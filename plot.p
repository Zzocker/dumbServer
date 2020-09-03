set terminal png size 1280,720

set output "src/benchmark.png"

set title "ab -t 1000 -c 1000"

set grid y

set xlabel "request"

set ylabel "response time (ms)"
set key left

plot "tsvfiles/node.tsv" using 9 smooth sbezier with lines title "node", \
 "tsvfiles/go.tsv" using 9 smooth sbezier with lines title "go",\
 "tsvfiles/express.tsv" using 9 smooth sbezier with lines title "express",\
 "tsvfiles/python.tsv" using 9 smooth sbezier with lines title "japronto",\
 "tsvfiles/gofast.tsv" using 9 smooth sbezier with lines title "gofast"



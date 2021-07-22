
BIN=`which perf`

PERF_DATA_PATH=/tmp/perf.data
PERF_SVG_PATH=/tmp/perf.svg

if [ "$#" -gt 0 ]; then
    PERF_DATA_PATH=$1
fi

if [ "$#" -gt 1 ]; then
    PERF_SVG_PATH=$2
fi

sudo $BIN script -i $PERF_DATA_PATH | stackcollapse-perf.pl | flamegraph.pl --width 2000 --height 20 > $PERF_SVG_PATH
#sudo rm $PERF_DATA_PATH
sudo chmod 666 $PERF_SVG_PATH

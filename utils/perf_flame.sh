BIN=`which perf`
PERF_DATA_PATH=/tmp/perf.data
PERF_SVG_PATH=/tmp/perf.svg

if [ "$#" -gt 0 ]; then
    PERF_DATA_PATH=$1
fi

if [ "$#" -gt 1 ]; then
    PERF_SVG_PATH=$2
fi

sudo $BIN record -F 99 -a --call-graph dwarf -o $PERF_DATA_PATH -- sleep 10
perf_to_flame.sh $PERF_DATA_PATH $PERF_SVG_PATH
google-chrome $PERF_SVG_PATH &

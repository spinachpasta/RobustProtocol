#!/bin/sh
rm data/*
rm data_rcv/*
rm check.md5
for i in `seq 0 1999`
do
    cat /dev/urandom | base64 | head -c 102400 > data/data$i
done

echo "Created file."

cd data
md5sum $(find . -type f) | tee ../check.md5
cd ..

echo "Done."

#!/bin/bash

# generate some jpgs
rm ./bills/bill_*
for i in {1..100}
do
    echo "$i"
    cp bills/bill.jpg "bills/bill_$i.jpg"
done

# # convert jpg to png (serial)
# rm ./bills/*.png
# for f in ./bills/*.jpg
# do
#    echo "$f"
#    sips -s format png "$f" --out "${f%.jpg}.png"
# done

# convert jpg to png (parallel)
rm ./bills/*.png
find ./bills -name "*.jpg" | parallel -I% --max-args 1 sips -s format png % --out %.png
# find ./bills -name "*.jpg" | parallel -I% --max-args 1 echo "${%}%.jpg"

#!/bin/bash

# # generate some jpgs
# rm ./bills/bill_*
# for i in {1..100}
# do
#     echo "$i"
#     cp bills/bill.jpg "bills/bill_$i.jpg"
# done

# # convert jpg to png (serial)
# rm ./bills/*.png
# for f in ./bills/*.jpg
# do
#    echo "$f"
#    sips -s format png "$f" --out "${f%.jpg}.png"
# done

# convert jpg to png (parallel)
rm ./bills/*.png
# find ./bills -name "*.jpg" | parallel -I% --max-args 1 sips -s format png % --out %.png
# find ./bills -name "*.jpg" | parallel --max-args 1 sips -s format png {} --out {.}.png
parallel --max-args 1 sips -s format png {} --out "{.}.png" ::: ./bills/*.jpg

# # list files
# find ./bills -name "*" | parallel --max-args 1 echo {}
# find ./bills -name "*" | parallel --max-args 1 echo {.}     # strip extension
# find ./bills -name "*" | parallel --max-args 1 echo {/}     # strip path
# find ./bills -name "*" | parallel --max-args 1 echo {/.}    # strip path and extension
# find ./bills -name "*" | parallel --max-args 1 echo {//}    # keep only path

# # line-by-line from file
# # the three lines below are equivalent
# parallel -a ./bills/bills.txt echo
# cat ./bills/bills.txt | parallel echo
# parallel echo < ./bills/bills.txt

# # list job number
# parallel echo {#} ::: bills/*.jpg

# # list job slot number
# # We give parallel 4 CPUs.
# parallel -j 4 echo {%} ::: bills/*.jpg

# set the field separator for input and output file to ";"
BEGIN { FS=OFS=";" }
$1 == p1 { prev = prev OFS $NF; next }
{ if (NR>1) print prev; prev=$0; p1=$1 }
END { print prev }
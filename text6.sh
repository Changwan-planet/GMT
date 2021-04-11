#!/bin/bash
# Examples of lines with different pen settings


gmt begin symbols_ png
    echo 0 0 | gmt plot -R-1/6/-1/6 -JX15c/15c -BWSen+t"Symbols & pens" -Ba2g1 -Ggreen -Sc0.75c

    echo 1 0 | gmt plot -Ggreen -W1p,black -Sc0.75c


    echo 0 3 | gmt plot -Gbrown -W1p -Skflash/2.0c


    echo 3 3 | gmt plot -Gred -W1p -Skvolcano/2.0c

    echo 5 5 | gmt plot -Sk@gallo/3.5c

    echo 2 3 | gmt plot -Sk@sardinha/6c


gmt end show 


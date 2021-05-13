#!/bin/bash
#Examples of line with different pen settings

region=-R0/10/0/10
projection=-JX14c
gmt begin lines png

    #Continuous red line 
    echo  0 0 > t.dat
    echo  3 2 >> t.dat
    echo  6 5 >> t.dat
    echo  9 10 >> t.dat

#gmt set PLOT_DEGREE_FORMANT +D

    gmt plot t.dat $region $projection -W1p,red 
    gmt basemap $region $projection --MAP_ANNOT_OFFSET_SECONDARY=10p \
                --MAP_GRID_PEN_SECONDARY=2p -Bafg -BWS -Bx+l"Time" -By+l"Distance"

gmt end show


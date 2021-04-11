#!/bin/bash

#Extract the outline of mainland Italia and use it as example for
#filling polygons

#Extract the Italian border from the GMT DCW countries dataase
gmt pscoast -EKR -M | gmt convert -C+l3000 -bof > kor.bin

gmt begin kor_I png
   

    #gmt plot italia.bin -bi2f -R6/19/37/47.5 -JM15 -Baf
    #-W1,dash -Glightblue
    
    #Plot the Italian border using the polygon in binary format,
    #and paint it

    gmt plot kor.bin -bi2f -R126/130/33/40 -JM15c -Baf -W1p -Gp32+r100+fblue

    #Add the "meca" symbol at the tip of the Italian "boot"

#    echo 14 39 | gmt plot -Skmeca/3c -G100 -Wfaint
    
gmt end show
    


#!/bin/bash

#Extract the outline of mainland Italia and use it as example for
#filling polygons

#Extract the Italian border from the GMT DCW countries dataase
gmt pscoast -EIT -M | gmt convert -C+l3000 -bof > italia.bin

gmt begin italia_I png
   

    #gmt plot italia.bin -bi2f -R6/19/37/47.5 -JM15 -Baf
    #-W1,dash -Glightblue
    
    #Plot the Italian border using the polygon in binary format,
    #and paint it

    gmt plot italia.bin -bi2f -R6/19/37/47.5 -JM15c -Baf -W1p -Gp32+r100+fblue

    #Add the "meca" symbol at the tip of the Italian "boot"

    echo  7 39 | gmt plot -Skmeca/1c -G100 -Wfaint
    echo  9 40 | gmt plot -Skmeca/1c -G100 -Wfaint
    echo 11 41 | gmt plot -Skmeca/1c -G100 -Wfaint
    echo 13 40 | gmt plot -Skmeca/1c -G100 -Wfaint
    echo 15 39 | gmt plot -Skmeca/1c -G100 -Wfaint
    echo  7 39 
    echo 15 
gmt end show
    


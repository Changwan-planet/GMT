#!/bin/bash

#Contour plot of the world topography using the defaults

gmt begin contour-world png
   
    # global -> short cut g
    # or -R-180/180
    # -J : prjection 15 cemtemeter 
    # -B : Border 
    # -Baf : automtic frame

    gmt basemap -Rg -JW0/15c -Bafa
    
   
    # default
    gmt grdcontour @earth_relief_10m

gmt end show 


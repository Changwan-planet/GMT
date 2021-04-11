#!/bin/bash

#Image plot of Antarctica topography

gmt begin atarctica_image

  # gmt basemap -JCM/15c -R126/130/33/40  -Baf
    gmt basemap -JCM/15c -RAS  -Baf


    #if you have your own file, 
    #gmt grdimage /path/filename
    #-I+d : control the light to make hillshade 
    gmt grdimage @earth_relief_10m -I+d -Cgray 
     

    #Place the colorbar (-D) on the outside of the plot (-DJ)
    #in the middle right (-DJMR) of the plot. Set the annotation
    #interval to 1000 and add a label for meters "m" to the y axis
    #of the colorbar.

    gmt colorbar -DJMR -B1000 -By+l"m"

gmt end show 


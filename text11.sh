#!/bin/bash

#Contour map fo Antarctica


gmt begin antarctica 

    #-J : projection
    # stereogrphic projection to the south pole
    # -JSlatitude/longitude/size of the plot
    #-C : contour 
    #-A : Annotation 
    #-Wc : width for contour
    #-Wa : width for annotation 

    gmt basemap -RAQ -JS0/-90/15c -Baf
   
    gmt grdcontour @earth_relief_10m -C1000 -A2000 -Wcthinnest,red -Wathinnest,black

    #

gmt end show

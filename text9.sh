#!/bin/bash

#Extract the outline of mainland Italia and use it as example for
#filling polygons

#Extract the Italian border from the GMT DCW countries dataase
gmt pscoast -EIT -M | gmt convert -C+l3000 -bof > italia.bin

gmt begin italia_I png
 
#Create a polyline simutating an arc
#    echo  7 39  > t.dat
#    echo  9 40 >> t.dat
#    echo 11 41 >> t.dat
#    echo 13 40 >> t.dat
#    echo 15 39 >> t.dat
 
    echo 15.0 39.0  > t.dat
    echo 13.0 40.0 >> t.dat
    echo 11.0 40.5 >> t.dat
    echo  9.0 40.2 >> t.dat
    echo  7.0 39.5 >> t.dat



    #gmt plot italia.bin -bi2f -R6/19/37/47.5 -JM15 -Baf
    #-W1,dash -Glightblue
    
    #Plot the Italian border using the polygon in binary format,
    #and paint it

    gmt plot italia.bin -bi2f -R6/19/37/47.5 -JM15c -Baf -BWSen+t"The Italian seismologist" -W1p -Gp32+r100+fblue


  #plot a dashed line
   gmt plot t.dat -W1,dashed+s
 
  #Repeat the symbol at the polyline vertices
   gmt plot t.dat -Skmeca/1.5c -G100 -Wfaint


gmt end show
    


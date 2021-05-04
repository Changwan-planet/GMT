#!/bin/bash


region="-R129.0/129.2/35.2/35.4"
projection="-JM4i"



gmt begin test_DEM png

	gmt basemap $region $projection -Baf

#-I+d : control the light to make hillshade
        
	gmt grdimage ASTGTMV003_N35E129_dem.nc $region $projection -C -I+d
#Place the colorbar (-D) on the outside of the plot (-DJ)
#in the middle right (-DJMR) of the plot. Set the annotation
#interval to 1000 and add a label for meters "m" to the y axis
#of the colorbar

        gmt colorbar -DJMR -B1000 -By+l"m"

        gmt psxy

         
gmt end show

#!/bin/bash


region="-R130.98/131.08/-25.38/-25.31"
projection="-JM4i"


#gmt makecpt -Cpolar -T-200/200/25 > colors.cpt
gmt makecpt -T500/860/25 -Chaxby -D > reliefColors.cpt
gmt makecpt -T500/860/25 -Cgray -D > hillShadeColors.cpt
#


#gmt gmtset MAP_FRAME_TYPE plain
#gmt set GMT_THEME cookbook


gmt begin Korea png

    gmt basemap $region $projection -Baf 
 
#    gmt basemap $region $projection -Baf -BWSn+t"Hello" 
    #gmt basemap -RKR -JM15c -Baf 


    #if you have your own file, 
    #gmt grdimage /path/filename
    #-I+d : control the light to make hillshade 
    #gmt grdimage @earth_relief_01m -I+d  
#    gmt grdimage clip_2.grd 

    #Place the colorbar (-D) on the outside of the plot (-DJ)
    #in the middle right (-DJMR) of the plot. Set the annotation
    #interval to 1000 and add a label for meters "m" to the y axis
    #of the colorbar.
   
#    gmt colorbar -DJMR -B50 -By+l"m"

#gmt makecpt -T500/860/25 -Chaxby  >  reliefColors.cpt
#    gmt makecpt -Cpolar -T-200/200/25 > colors.cpt

    misc="-A90/45 -V"
#    misc="-A0/270 -V"
    gmt grdgradient clip_2.grd -Ggradients.nc $misc


#    gmt grdgradient @earth_relief_05m -R0/20/0/20 -A0/270 -Ggradients.nc -Ne0.6 -V


#Plot the colored relief map (using haxby)
    gmt grdimage clip_2.grd $region $projection -CreliefColors.cpt 

#Plot the hillshape on top of the relief map with 50% transparency
    gmt grdimage clip_2.grd $region $projection -Igradients.nc -t50 -ChillShadeColors.cpt 

#Plot 100 m contours on the map
gmt grdcontour clip_2.grd -C100 $region $projection -W1p 

#Add the elevation profile on the map
gmt psxy profile.xy -W2p $region $projection 

#Add the Scale Bar
gmt psbasemap $region $projection -Lfx1i/0.3i/-25.355/3k+u

#Add a color bar for the elevation map
gmt psscale -D2i/-0.35i/2i/0.15ih -CreliefColors.cpt -B100 

#Set new parameters for the elevation profile
region="-R131/131.063/500/880"
projection="-JX4i/1i"

#Extract the elevations along the lat/long in the input file, profile.xy
gmt grdtrack -Gclip_2.grd profile.xy | awk '{print $1, $3}' | gmt psxy $region -W2p -Y-2.25i $projection

#Add the labels to the subset
gmt psbasemap $region $projection -Ba -BWSen+t"Elevation (m)"



#    gmt colorbar -DJMR -B1000 -By+l"m"


gmt end show 


#!/bin/bash

region="-R129.0/129.3/35.3/35.6"
projection="-JM15c"

#continuous cpt
#gmt makecpt -T0/1214/50 -Cdem3 > reliefColors.cpt
#You do not have to always use maximum and minimum values in the -T option.

gmt makecpt -T0/1000/5 -Cdem4 > reliefColors.cpt

#gmt makecpt -T0/600/50 -Chaxby > reliefColors.cpt


#discriete cpt
#gmt makecpt -Cgreen,brown -T0,400,800 >reliefColors.cpt
#gmt makecpt -Cdem3 -T0,200,400,600,800,1000,1214  > reliefColors.cpt


gmt begin test_DEM png
#-I+d : control the light to make hillshade
        
	gmt grdimage ASTGTMV003_N35E129_dem.nc $region $projection -CreliefColors.cpt -I+d


#Place the colorbar (-D) on the outside of the plot (-DJ)
#in the middle right (-DJMR) of the plot. Set the annotation
#interval to 1000 and add a label for meters "m" to the y axis
#of the colorbar


#colorbar
      #cm        # origin     #height  
    gmt psscale -D2.45c/-1c/5c/0.3ch -CreliefColors.cpt -B200 -By+l"[m]"
                           #length

#Anchor point or reference point specifcation
# J                j,g,x,n 

#scale border
     gmt basemap $region $projection -B0.05+f -BWSen 

#Map scale                                 #origin            #fancay scale bar
   gmt basemap $region $projection -LjRB+c35.4N+o1c/-1.3c+w10k+f2+l
                                                #dx/dy   #length #lable 
#Directional map rose
     gmt basemap $region $projection -T.

#Map legend:w!

#Background panel


#Select two points along the fault
cat <<- EOF > channel.txt
#lon   /  lat
129.1 35.5
129.2 35.5

EOF

#Plot fault segment and end points
gmt plot $region $projection -W2p,blue channel.txt
gmt plot -Sc0.25c -Gblue channel.txt



#Generate cross-profiles 400 km long, spaced 10 km, sampled every 2 km
#and stack these using the median, write stacked profile

gmt grdtrack channel.txt -GASTGTMV003_N35E129_dem.nc -C5k/1k/2k+v -Sm+sstack.txt > table.txt
gmt plot -W0.5p table.txt

#Show upper/lower values encountered as an envelope

gmt convert stack.txt -o0,5 > env.txt
gmt convert stack.txt -o0,6 -I -T >> env.txt


#gmt plot 
#Add the elevation profile on the mapp
#gmt psxy profile.xy -W2p $region $projection




#Add the elevation profile on the mapp
#gmt psxy profile.xy -W2p $region $projection





#gmt inset
                   #Location in the set  #Framce 
                        #wide & height  #origin
    gmt inset begin -DjTR+w2.5c/4.5c+o0.3c/0.3c -F+gwhite+p1p+c0.1c+s
    #gmt coast -Rg -JG130E/38N/4c -Gwheat -Bg -EKR+ggreen

        gmt coast -JM? -R123/132/33/45 -Gwhite -Wfaint -N1 -EKR+ggreen -B0 
        
    #location in the subset                  the size of star
        echo 128.6 35.9 | gmt plot -Gred -W1 -Skstar/0.3c
    gmt inset end 

gmt end show

#!/bin/bash

$region
$projection



gmt begin YSF png

    gmt coast -R123/132/33/45 -Gdarkseagreen2 -Scornflowerblue -Ba2f0.5g2 \
    -BWSne+t"Yangsan Fault System" -Wfaint -N1/faint -A0.1
  
    gmt basemap --MAP_FRAME_TYPE=fancy -Ba2f1g2 
gmt end show









#gmt begin test png

#    gmt coast -R19.42/22.95/59.71/60.56 -JM6i -W0.1p,black -Gdarkseagreen2 \
#              -Scornflowerblue -Ba2f0.5g1 -BWSnet+t"Archipelago Sea" -A0.1 \
#             \-png archi_sea 

#gmt end show

#!/bin/bash

#filename
file=B_SCAN_IMAGE_GPR.txt

#region coloumns/records | columns are fields and records are rows

#       type them in a ascending orer
region=-R0/399/-199/0


#gmt makecpt -Crainbow -T-3590336.0/3103296.0/100.0 > colors.cpt


#if you get strange image, please check DO-loop for output in the Fortran program.

gmt begin b_scanf png
 
     gmt xyz2grd $file $region -Gb_scanf.grd -I1/1 -ZTLA
     gmt grdimage b_scanf.grd $region -BWS  -Cvik
     gmt basemap $region -Bx50+l"Distance (m)" -By50 -BWseN
gmt end show







#!/bin/bash
# Making a map of Italy

gmt begin italy png, pdf, jpg 

#coast module
    #             W E S N
#    gmt coast -R126/130/33/37 -Gwheat -B -Wthin -JM15c -N1/thick,red \
#       -EKR+gred
    gmt coast -R5/20/36/48 -Gwheat -B -Wthin -JM15c -N1/thick,red \
       -EIT+gred

        #gmt inset
        #  gmt inset begin ...
        #      gmt coast
        #  gmt inset end 


gmt end show 

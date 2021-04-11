#!/bin/bash
#Examples of line with different pen settings

gmt begin lines png

    #Continuous red line 
    echo  0 0 > t.dat
    echo 10 1 >> t.dat
    gmt plot t.dat -R-1/11/-1/11 -JX14c -Baf -BWSen -W1p,red
3

    #Continuous red line 
    echo  0 0 > t.dat
    echo 10 2 >> t.dat
    gmt plot t.dat -W3p,green

    #Continuous red line 
    echo  0 2 > t.dat
    echo 10 3 >> t.dat
    gmt plot t.dat -W3p,blue,dashed

    #Continuous red line 
    echo  0 4 > t.dat
    echo 10 5 >> t.dat
                       #indicate the coloar the RGB number
    gmt plot t.dat -W1p,0/0/0,.




gmt end show


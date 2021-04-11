#!/bin/bash
# Introduce subplot

gmt begin world jpg 

   gmt subplot begin 3x1 -Ff16c/25c -A
       gmt coast -Rg -JH0/? -G35/100/88 -Bg
       gmt coast -Rg -JR0/? -Gpurple -Bg -c
       gmt coast -Rg -JW0/? -Glightgray -Slightblue -Bg -c
   gmt subplot end 

gmt end show 

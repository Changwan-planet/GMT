#!/bin/bash

#Try the figure command

gmt begin 
    #Make Hammer map of the Earth
    gmt figure world1 png
    gmt coast -Rg -JH0/15c -Gorange -Bg
    
    #Make Robinson map of the Earth
    gmt figure world2 png
    gmt coast -Rg -JR0/15c -Gpurple -Bg


gmt end show

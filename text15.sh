#!/bin/bash

gmt begin
#    gmt set MAP_GRID_CROSS_SIZE_PRIMNARY 0
    gmt coast -R100/140/20/40 -JB125/20/25/45/12c -Bag -D1 -Ggreen -Wthinnest -A250

gmt end show


#!/usr/bin/bash

cd ~/work || exit
time ( gh repo clone MCMaurer/NBA_Data_Analysis; cp -r NBA_Data_Analysis home/culshawmaurer/ )

rm -rf home/culshawmaurer/NBA_Data_Analysis

cd ~/work/home/culshawmaurer || exit
time gh repo clone MCMaurer/NBA_Data_Analysis

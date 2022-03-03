#!/usr/biin/bash 

cd ~/work || exit

time cp -r home/culshawmaurer/storms_by_year .

rm -rf storms_by_year

time ( cp home/culshawmaurer/data/storms_by_year.zip . ; unzip storms_by_year.zip )

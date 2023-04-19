#!/bin/bash

datapath="data"

# Prepare directory
if [ -d "$datapath/new_pages/" ]; then
    rm -f $datapath/old_pages/*
    mv $datapath/new_pages/* $datapath/old_pages
else
    mkdir -p $datapath/new_pages
    mkdir -p $datapath/old_pages
fi

# Prepare csv file
if [ -f "$datapath/new_cars.csv" ]; then
  rm -f $datapath/old_cars.csv
  mv $datapath/new_cars.csv $datapath/old_cars.csv
else
  touch $datapath/old_cars.csv
fi
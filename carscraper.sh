#!/bin/bash

scriptpath="scripts"

$scriptpath/env_prep.sh
$scriptpath/load_cars.sh "$1"
$scriptpath/csv_generator.sh

if [ -s "new_cars_only.csv" ]; then
  echo "Új autó került fel a keresett kategóriában:"
  awk -F "|" '{printf "%s (Link: %s)\n", $1, $2}' new_cars_only.csv

fi

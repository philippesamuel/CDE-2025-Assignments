#!/bin/bash

# CONSTANTS
RAW_CSV_URL=https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv
RAW_CSV_PATH=raw/2023_year_finance.csv
TRANSFORMED_CSV_PATH=transformed/2023_year_finance.csv
LOAD_CSV_PATH=gold/2023_year_finance.csv

# create necessery folders
mkdir raw transformed gold

# EXTRACT
# download csv file
curl -o $RAW_CSV_PATH $RAW_CSV_URL

# test that file exists
if [ -f "$RAW_CSV_PATH" ]; then
  echo "$RAW_CSV_PATH exists."
fi

# TRANSFORM
# read first line
# indices of desired columns `year, Value, Units, variable_code`
# 1, 9, 5, 6 (I'm too lazy to automate that now)

CSV_HEADER_RAW=$(head -n 1 $RAW_CSV_PATH | cut -d, -f1,9,5,6)
echo "${CSV_HEADER_RAW/Variable_code/variable_code}" > $TRANSFORMED_CSV_PATH
sed '1d' $RAW_CSV_PATH | cut -d, -f1,9,5,6 >> $TRANSFORMED_CSV_PATH

# LOAD
cp $TRANSFORMED_CSV_PATH $LOAD_CSV_PATH

# test that file exists
if [ -f "$LOAD_CSV_PATH" ]; then
  echo "$LOAD_CSV_PATH exists."
fi

#!/bin/bash

# W205 Spring 2016, Exercise 1
# D. M. Burt


# 1) COPY DATA FILES FROM GITHUB
# 
# Commands below are commented for easier customizability of user directory location for TA.
# cd /home/w205/
# mkdir Exercise1
# cd Exercise1
wget https://raw.githubusercontent.com/dmburt/w205/master/Exercise1_data.tar.gz
tar -xzvf Exercise1_data.tar.gz
wget https://raw.githubusercontent.com/dmburt/w205/master/hive_base_ddl.sql
wget https://raw.githubusercontent.com/dmburt/w205/master/hive_transform_tables.sql


# 2) REMOVE HEADERS FROM DATA FILES
# 
tail -n +2 HQI_HOSPITAL_COMP.csv > load_HQI_HOSPITAL_COMP.csv
tail -n +2 HQI_OP_Procedure_Volume.csv > load_HQI_OP_Procedure_Volume.csv
tail -n +2 HQI_HOSP.csv > load_HQI_HOSP.csv
tail -n +2 HQI_HOSP_HCAHPS.csv > load_HQI_HOSP_HCAHPS.csv


# 3) START HADOOP AND POSTGRESQL
#
# Commented--TA may already have this running in AMI.
# /root/start-hadoop.sh
# /data/start_postgres.sh


# 4) LOAD DATA TO HDFS
#
# Make HDFS folder for data sets and copy files to this folder
# Note: ran into issues with DDL reading location properly.  If only folder was specified,
#       the resulting tables appeared to be created with duplication.  The fix here is to
#       create a separate data set folder (ds) for each file.
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/ds1
hdfs dfs -mkdir /user/w205/hospital_compare/ds2
hdfs dfs -mkdir /user/w205/hospital_compare/ds3
hdfs dfs -mkdir /user/w205/hospital_compare/ds4
hdfs dfs -put load_HQI_HOSP.csv /user/w205/hospital_compare/ds1/HQI_HOSP
hdfs dfs -put load_HQI_HOSPITAL_COMP.csv /user/w205/hospital_compare/ds2/HQI_HOSPITAL_COMP
hdfs dfs -put load_HQI_HOSP_HCAHPS.csv /user/w205/hospital_compare/ds3/HOSP_HCAHPS
hdfs dfs -put load_HQI_OP_Procedure_Volume.csv /user/w205/hospital_compare/ds4/HQI_OP_Procedure_Volume



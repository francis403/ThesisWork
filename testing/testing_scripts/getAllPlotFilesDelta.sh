#!/bin/bash

OUTDIR="../csv_files/test1h"

#Need to get the ones in out1 as well

#DEVELOP ALL csvs#

COUNTER=0

if [ $# -ne 2 ]
then
	echo "No arguments supplied"
	echo "$0 <path-to-testsdir> <path-to-outdir>"
	exit
fi

TEST_DIR=$1
OUTDIR=$2


for d in $TEST_DIR/*
do
	echo ""
	(echo "cp $d/out0/plot_data $OUTDIR/plot_data_$COUNTER.csv")
	echo ""
	(eval "cp $d/out0/plot_data $OUTDIR/plot_data_$COUNTER.csv")
	echo $COUNTER
	((COUNTER++))
	#(eval "cp $d/out1/plot_data $OUTDIR/plot_data_$COUNTER.csv")
	#echo $COUNTER
	#((COUNTER++))

done

# Develop main csv #

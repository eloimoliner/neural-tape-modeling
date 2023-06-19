#!/bin/bash
: '
Calls generate-targets.py
'

# SETTINGS
DATASET=$1
SUBSET=$2
FRACTION=$3
SEGMENT_LENGTH=$4
TAPE_DRIVE=$5
TAPE_SATURATION=$6
TAPE_BIAS=$7
WOWFLUTTER=True

# Construct descriptive name
# DESCRIPTIVE_NAME="_F[$FRACTION]_SL[$((SEGMENT_LENGTH/44100))]"
DESCRIPTIVE_NAME="_F[$FRACTION]"
DESCRIPTIVE_NAME=$DESCRIPTIVE_NAME"_TD[$TAPE_DRIVE]_TS[$TAPE_SATURATION]_TB[$TAPE_BIAS]"
if [ $WOWFLUTTER == True ]; then
    DESCRIPTIVE_NAME=$DESCRIPTIVE_NAME"_WOWFLUTTER"
fi

# Run
if [ $WOWFLUTTER == True ]; then
    python -u ../code/generate-targets.py \
        --DATASET $DATASET --SUBSET $SUBSET --FRACTION $FRACTION --SEGMENT_LENGTH $SEGMENT_LENGTH --PRELOAD --NO_SHUFFLE \
        --TAPE_DRIVE $TAPE_DRIVE --TAPE_SATURATION $TAPE_SATURATION --TAPE_BIAS $TAPE_BIAS \
        --DESCRIPTIVE_NAME $DESCRIPTIVE_NAME --NO_SHUFFLE \
        --WOW_FLUTTER_ENABLE \
        # --TAPE_DISABLE
else
    python -u ../code/generate-targets.py \
        --DATASET $DATASET --SUBSET $SUBSET --FRACTION $FRACTION --SEGMENT_LENGTH $SEGMENT_LENGTH --PRELOAD --NO_SHUFFLE \
        --TAPE_DRIVE $TAPE_DRIVE --TAPE_SATURATION $TAPE_SATURATION --TAPE_BIAS $TAPE_BIAS \
        --DESCRIPTIVE_NAME $DESCRIPTIVE_NAME --NO_SHUFFLE
fi


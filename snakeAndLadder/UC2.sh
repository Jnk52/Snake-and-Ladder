#!/bin/bash -x
echo "snake and laddder starts"

#Initialize variables
numberOfPlayers=1;
startPosition=0;

diceRole=$((1+RANDOM%6))
echo "$diceRole"

#!/bin/bash

#CONSTANTS AND VARIABLES
LADDER=1;
SNAKE=2;
NO_PLAY=0;
NUMBER_OF_PLAYER=1;
WINNING_POSITION=100;
START_POSITION=0;
diceRole=0;
position=0;

positon=$startPosition
playerMoves() {
        stepsMoved=$((1+RANDOM%6))
        option=$((RANDOM%3))
        case $option in
                $LADDER)
                        position=$(($position+$stepsMoved))
                        if [ $position -gt $WINNING_POSITION ]
                        then
                                position=$((position-stepsMoved))
                        fi
                        echo "$position"
                        ;;
                $SNAKE)
                        position=$(($position-$stepsMoved))
                        if [ $position -lt $START_POSITION ]
                        then
                                position=$START_POSITION
                        fi
                        echo "$position"
                        ;;
                $NO_PLAY)
                       position=$(($position+0))
                       ;;
        esac


}

while (( $position < $WINNING_POSITION ))
do

        playerMoves
	((diceRole++))
	echo "player position=$position at $diceRole diceRole"
done
echo "player won the game $position"
echo "dice was rolled for $diceRole times"


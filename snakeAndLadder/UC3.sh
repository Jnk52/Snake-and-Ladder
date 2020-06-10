#!/bin/bash -x
echo "Welcome to snake and ladder"

#CONSTANTS AND VARIABLES

LADDER=1
SNAKE=2
NO_PLAY=0
NUMBER_OF_PLAYER=1

startPosition=0
position=0
option=$((RANDOM%3))
stepsMoved=$((RANDOM%6+1))
case $option in
	$LADDER)
		position=$((startPosition+stepsMoved))
		echo "player moved $position steps forward"
		;;
	$SNAKE)
		position=$((startPositon+stepsMoved))
		echo "player moved $position steps backward"
		;;
	$NO_PLAY)
		position=$((startPosition+0))
		echo "player on same position"

		;;
esac

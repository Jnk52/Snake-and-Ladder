#!/bin/bash
#constant
LADDER=1
SNAKE=2
NO_PLAY=0
NUMBER_OF_PLAYER=1
WINNING_POSITION=100
START_POSITION=0

#variables
declare -a player1Position
declare -a player2Position
playerOnePosition=$START_POSITION
playerTwoPosition=$START_POSITION
count1=0
count2=0
playerOne() {
        stepsMoved=$((RANDOM%6+1))
        option=$((RANDOM%3))
        case $option in
                $LADDER)
                        playerOnePosition=$(($playerOnePosition+$stepsMoved))
                        if [ $playerOnePosition -gt $WINNING_POSITION ]
                        then
                                playerOnePosition=$((playerOnePosition-stepsMoved))
                        fi
                        ;;
                $SNAKE)
                        playerOnePosition=$(($playerOnePosition-$stepsMoved))
                        if [ $playerOnePosition -lt $START_POSITION ]
                        then
                                playerOnePosition=$START_POSITION
                        fi
                        ;;
                $NO_PLAY)
                       playerOnePosition=$(($playerOnePosition+0))
                       ;;
        esac

        player1Position[((count1++))]=$playerOnePosition
        ((dice1++))

}

playerTwo() {
        stepsMoved=$((RANDOM%6+1))
        option=$((RANDOM%3))
        case $option in
                $LADDER)
                        playerTwoPosition=$(($playerTwoPosition+$stepsMoved))
                        if [ $playerTwoPosition -gt $WINNING_POSITION ]
                        then
                                playerTwoPosition=$((playerTwoPosition-stepsMoved))
                        fi
                        ;;
                $SNAKE)
                        playerTwoPosition=$(($playerTwoPosition-$stepsMoved))
                        if [ $playerTwoPosition -lt $START_POSITION ]
                        then
                                playerTwoPosition=$START_POSITION
                        fi
                        ;;
                $NO_PLAY)
                       position=$(($playerTwoPosition+0))
                       ;;
        esac
        player2Position[((count2++))]=$playerTwoPosition



        ((dice2++))
}



while [[ $playerOnePosition -lt $WINNING_POSITION && $playerTwoPosition -lt $WINNING_POSITION ]]
do

        playerOne
        while [ $option -eq $FORWARD_MOVE ]
        do
                        playerOne
        done

        playerTwo
        while [ $option -eq $FORWARD_MOVE ]
        do
                        playerTwo
        done

done

for print1 in ${player1Position[@]}
do
        echo player one position is $print1
done

for print2 in ${player2Position[@]}
do
        echo player two position is $print2
done
echo "player one total dice roll is $dice1"
echo "player two total dice roll is $dice2"
if [ $playerOnePosition -eq $WINNING_POSITION ]
then
        echo "player one  wins the game of Snkae and Ladder"
else
        echo "player two is wins the game of Snake and Ladder"
fi

#!/bin/bash

#This is where you will write your LetterSequence.sh script.
#!/bin/bash

# --------------------------------------------------
# Letter Sequence Game
# Instructions:
# Watch the letters displayed by the computer.
# Type the entire sequence exactly as shown.
# The sequence gets longer each round.
# Reach 5 letters to win the game!
#
# Expected user input:
# A sequence of uppercase letters such as:
# A
# AT
# ATC
#
# Expected output:
# The computer displays a sequence,
# asks for user input,
# and reports whether the sequence matches.
# --------------------------------------------------

# I chose a WHILE loop because the game repeats
# until the player either wins or makes a mistake.
# This is a good example of computer logic because
# the same block of code runs multiple times.

# Available letters
letters=("A" "T" "C" "G")

sequence=""
round=1
goal=5

echo "Welcome to the DNA Sequence Memory Game!"
echo "Repeat the DNA sequence exactly as shown."
echo "Reach a sequence length of $goal to win."
sleep 3

while [ $round -le $goal ]
do
    # Randomly choose one DNA letter
    random_letter=${letters[$RANDOM % 4]}

    # Add letter to existing sequence
    sequence="$sequence$random_letter"

    clear
    echo "Round $round"
    echo "Memorize this sequence:"
    sleep 1

    # Display one letter at a time
    for (( i=0; i<${#sequence}; i++ ))
    do
        echo "${sequence:$i:1}"
        sleep 1
        clear
    done

    # User enters the sequence
    echo "Enter the sequence:"
    read userinput

    # Comparison requirement:
    # This IF statement checks whether the user's
    # sequence matches the computer's sequence.
    #
    # If the user enters the correct letters but
    # uses lowercase instead of uppercase,
    # the comparison will fail because Bash
    # considers uppercase and lowercase different.
    if [ "$userinput" = "$sequence" ]
    then
        echo "Correct!"
        sleep 2
        round=$((round + 1))
    else
        echo "Incorrect!"
        echo "The correct sequence was: $sequence"
        echo "Game Over."
        exit 0
    fi
done

echo "Congratulations!"
echo "You successfully repeated a sequence of $goal letters!"
echo "You win!"
#Make sure to record your thoughts and instructions in your OWN words in the comments 
#and to use the comments to show that you can explain your code.
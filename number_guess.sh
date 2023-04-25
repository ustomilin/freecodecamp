#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  echo 'Enter your username:'
  read USER

  #find user in db
  PLAYED=$($PSQL "SELECT played FROM users WHERE username='$USER'")
  
  # if user doesn't exist in db
  if [[ -z $PLAYED ]]
  then 
    echo "Welcome, $USER! It looks like this is your first time here."
  else
    BEST=$($PSQL "SELECT best FROM users WHERE username='$USER'")
    echo "Welcome back, $USER! You have played $PLAYED games, and your best game took $BEST guesses."
  fi 

  # generate random number
  NUM=$(( $RANDOM % 1000 + 1 ))

  echo -e "\n Guess the secret number between 1 and 1000:"
  read GUESS

  TRY=1

  # check the answer until it is guessed
  while [ $GUESS != $NUM ]
  do 
    if [[ $GUESS =~ ^[0-9]+$ ]]
    then
      if [[ $GUESS -lt $NUM ]]
      then
        echo "It's lower than that, guess again:"
      else 
        echo "It's higher than that, guess again:"
      fi
    else
      echo "That is not an integer, guess again:"
    fi
    TRY=$((TRY+1))
    read GUESS 
  done
  echo "You guessed it in $TRY tries. The secret number was $NUM. Nice job!"

  PLAYED=$((PLAYED+1))

  #insert stats to db
  if [[ -z $BEST ]]
  then
    BEST=$TRY
    INSERT_TO_DB=$($PSQL "INSERT INTO users(username, played, best) VALUES('$USER', $PLAYED, $BEST)")
  elif [[ $TRY < $BEST ]] 
  then
    BEST=$TRY
    UPDATE_DB=$($PSQL "UPDATE users SET played=$PLAYED , best=$BEST WHERE username='$USER'")
  else
    UPDATE_DB=$($PSQL "UPDATE users SET played = $PLAYED WHERE username='$USER'")
  fi
  
}

MAIN

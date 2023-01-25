#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

EXISTING_USER=$($PSQL "select username from users where username='$USERNAME';")
if [[ -z $EXISTING_USER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  QUERY_RESULT=$( $PSQL "insert into users (username) values ('$USERNAME')" )
else
  USER_ID=$($PSQL "select user_id from users where username='$USERNAME';")
  GAMES_COUNT=$($PSQL "select count(*) from won_user_games where user_id='$USER_ID';")
  BEST_GAME_GUESS_COUNT=$($PSQL "select coalesce(min(guess_count), -1) from won_user_games where user_id=$USER_ID;")

  echo "Welcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $BEST_GAME_GUESS_COUNT guesses."
fi

GUESS_COUNT=0
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"
read NUMBER_GUESSED

while [ $RANDOM_NUMBER != $NUMBER_GUESSED ]
do
  if [[ ! $NUMBER_GUESSED =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    (( GUESS_COUNT++ ))
    if [[ $NUMBER_GUESSED -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $NUMBER_GUESSED -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
  fi
  read NUMBER_GUESSED
done
(( GUESS_COUNT++ ))

USER_ID=$($PSQL "select user_id from users where username='$USERNAME';")
QUERY_RESULT=$($PSQL "insert into won_user_games (user_id, guess_count) values ('$USER_ID', $GUESS_COUNT);")
echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
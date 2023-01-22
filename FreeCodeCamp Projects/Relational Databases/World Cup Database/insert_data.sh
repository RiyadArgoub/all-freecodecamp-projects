#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
if (( $YEAR != 'year' ))
then
  echo **Year: $YEAR, Round: $ROUND, Winner: $WINNER, Opponent: $OPPONENT, Winner_Goals: $WINNER_GOALS, Opponent_Goals: $OPPONENT_GOALS
  
  COUNT_WINNER=$($PSQL "SELECT COUNT(name) FROM teams WHERE name='$WINNER'") 
  echo *COUNT_WINNER*: $COUNT_WINNER
  
  if (( $COUNT_WINNER == 0 ))
  then   
    echo winner not in teams table. will insert them here.
    echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")   
  fi
  COUNT_OPPONENT=$($PSQL "SELECT count(name) FROM teams WHERE name='$OPPONENT'")
  echo *COUNT_OPPONENT*: $COUNT_OPPONENT
 
  if (( $COUNT_OPPONENT == 0 ))
  then
    echo opponent not in teams table. will insert them here.
    echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
  fi
fi

if (( $YEAR != 'year' ))
then
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
echo $($PSQL "INSERT INTO games(winner_id,opponent_id,year,round,winner_goals,opponent_goals) VALUES($WINNER_ID,$OPPONENT_ID,$YEAR,'$ROUND',$WINNER_GOALS,$OPPONENT_GOALS)")

fi

done
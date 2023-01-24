#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ $# -eq 0 ]] ; then
    echo 'Please provide an element as an argument.'
    exit 0
fi
INPUT_HERE=$1
MAIN_MENU() {

LENGTH=${#INPUT_HERE}
if [[ $INPUT_HERE =~ [[:digit:]] ]]
  then
  ATOMIC_NUMBER=$INPUT_HERE
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    if [[ -z $SYMBOL ]]
    then
    CANNOT_FIND
    fi
  ATOMIC_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  FINDER
elif [[ LENGTH -le 2 ]]
then
  SYMBOL=$INPUT_HERE
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$SYMBOL'")
    if [[ -z $ATOMIC_NUMBER ]]
    then
    CANNOT_FIND
    fi
    ATOMIC_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  FINDER
elif [[ LENGTH -gt 2 ]]
then
  ATOMIC_NAME=$INPUT_HERE
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$ATOMIC_NAME'")
    if [[ -z $ATOMIC_NUMBER ]]
    then
    CANNOT_FIND
    fi
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  FINDER
else
return Please provide an element as an argument.
fi
}
CANNOT_FIND() {
  echo I could not find that element in the database.
  exit 
}
FINDER() {
  TYPE=$($PSQL "SELECT type FROM types FULL JOIN properties USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")  
  MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  ATOMIC_NUMBER=`echo $ATOMIC_NUMBER | sed 's/ *$//g'`
  ATOMIC_NAME=`echo $ATOMIC_NAME | sed 's/ *$//g'`
  SYMBOL=`echo $SYMBOL | sed 's/ *$//g'`
  TYPE=`echo $TYPE | sed 's/ *$//g'`
  ATOMIC_MASS=`echo $ATOMIC_MASS | sed 's/ *$//g'`
  MELTING_POINT=`echo $MELTING_POINT | sed 's/ *$//g'`
  BOILING_POINT=`echo $BOILING_POINT | sed 's/ *$//g'`

  echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}
MAIN_MENU
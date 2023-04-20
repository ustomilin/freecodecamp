#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN() {
 # if argument is empty
 if [[ -z $1 ]]
 then
   echo "Please provide an element as an argument."
 else
   # if argument is number
   if [[ $1 =~ ^[0-9]+$ ]]
   then 
    NUM=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1 ")
   else
    NUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' or name = '$1' ")
   fi 

  # if element doesn't exist 
   if [[ -z $NUM ]]
   then
     echo I could not find that element in the database.
   else
     # find other properties
     SYM=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$NUM ")
     NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$NUM ")
     TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$NUM ")
     TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID ")
     MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$NUM ")
     MELT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$NUM ")
     BOIL=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$NUM ")
    
    # print info about element
     echo "The element with atomic number $NUM is $NAME ($SYM). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
   fi
 fi 

}

MAIN $1

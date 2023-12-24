#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

OUTPUT(){
  # atomic_mass
  # name
  # symbol
  # type name
  # atomic mass
  # melting_point
  # boiling_point
  echo "The element with atomic number $1 is $2 ($3). It's a $4, with a mass of $5 amu. $2 has a melting point of $6 celsius and a boiling point of $7 celsius."
}


MAIN(){
  echo -e "\nPlease provide an element as an argument."
  read ELEMENT

  BASE_QUERY="SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM properties LEFT JOIN elements USING(atomic_number) FULL JOIN types USING(type_id)"
  # search by name
  QUERY_RESULT=$($PSQL "$BASE_QUERY WHERE name = '$ELEMENT'")
  if [[ -z $QUERY_RESULT ]]
  then
    # search by symbol
    QUERY_RESULT=$($PSQL "$BASE_QUERY WHERE symbol = '$ELEMENT'")
  fi
  if [[ -z $QUERY_RESULT ]]
  then
    # search by atomic_number
    if [[ $ELEMENT =~ ^[0-9]+$ ]]
    then
      QUERY_RESULT="$($PSQL "$BASE_QUERY WHERE atomic_number = $ELEMENT")"
    fi
  fi
  if [[ -z $QUERY_RESULT ]]
  then
    echo -e "\nI could not find that element in the database."
  fi
  echo "$QUERY_RESULT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POIT BAR BOILING_POINT
  do
    OUTPUT $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POIT $BOILING_POINT
  done
}
MAIN
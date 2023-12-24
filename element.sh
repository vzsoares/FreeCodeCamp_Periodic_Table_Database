#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

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

  # TODO query
  # if not found
  # output "I could not find that element in the database."
  # else OUTPUT d a t a
}
MAIN
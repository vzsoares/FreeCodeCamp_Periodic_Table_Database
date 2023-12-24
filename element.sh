#!/bin/bash

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

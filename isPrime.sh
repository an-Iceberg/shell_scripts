#! /usr/bin/bash

# This script determines if a given number is prime or not

regexForNumber='^[0-9]+$';
askUserForNumber=false;

# --- Helper functions --- #

# Determines if a number is prime or not
# 0 == false, number is not prime
# 1 == true, number is prime
function isPrime()
{
  local parameter=$1;

  if (( $parameter == 2 ))
  then
    return 1;
  fi

  # A parameter divisible by 2 is not prime
  if (( $(($parameter % 2)) == 0 ))
  then
    return 0;
  fi

  # If no number can be found that can divide the parameter evenly, then the parameter is prime
  counter=3;
  while (( $counter <= ($parameter / 2) ))
  do
    # The parameter can be devided evenly by some other parameter, therefore it is not prime
    if (( $(($parameter % $counter)) == 0 ))
    then
      return 0;
    fi

    counter=$counter+2;
  done

  return 1;
}

# --- Script start --- #

# If exactly one argument was passed to the script
if (($# == 1))
then
  # User input is not a valid number
  if ! [[ $1 =~ $regexForNumber ]];
  then
    askUserForNumber=true;
  fi
# No arguments were passed to the script
else
  askUserForNumber=true;
fi

#echo "askUserForNumber: $askUserForNumber";

# Using case because if won't comply for some reason
case $askUserForNumber
in
  false )
    number=$1;
  ;;

  true )
    while true;
    do
      read -p "Please enter a valid number: " number

      if [[ $number =~ $regexForNumber ]]
      then
        break;
      fi
    done
  ;;
esac

# Factorizing part
isPrime $number
isNumberPrime=$?;

if (($isNumberPrime == 0))
then
  echo "$number is not prime."
else
  echo "$number is prime."
fi

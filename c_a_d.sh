#! /usr/bin/bash

# Clock arms degree calculator
# This script calculates the degrees between the two clock arms given a time

if (($# < 2))
then
  echo "Hour and Minute parameters must be added."
  exit
fi

# Returns the absolute difference between two inputs
function diff()
{
  if (($1 > $2))
  then
    return $(($1 - $2));
  fi

  return $(($2 - $1));
}

# $1 is hours, $2 is minutes

degreeMinutes=$(($2 * 6));
degreeHours=$(($1 * 30 + ($degreeMinutes / 72 * 6)));

diff $degreeMinutes $degreeHours;
degrees=$?;

#echo "$degreeMinutes, $degreeHours";
echo "The degree between the short arm and the long arm at $1:$2 is $degrees degrees.";

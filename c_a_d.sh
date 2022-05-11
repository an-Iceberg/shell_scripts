#! /usr/bin/bash

# This script calculates the degrees between the two clock arms given a time
echo;
echo "#----------------------------------------------------------------------------#";
echo "| This script calculates the degrees between the two clock arms given a time |";
echo "#----------------------------------------------------------------------------#";

# Returns the absolute difference between two given numbers
function diff()
{
  if (($1 > $2))
  then
    return $(($1 - $2));
  fi

  return $(($2 - $1));
}

isInputGood=true;

# Two arguments were passed to the script
if (($# == 2))
then
  # Inputs are in unacceptable range
  if (($1 < 0 || $1 > 12 || $2 < 0 || $2 > 60))
  then
    isInputGood=false;
  fi

# Wrong number of arguments was passed to the script
else
  isInputGood=false;
fi

case $isInputGood
in
  # Input is correct
  true )
    hours=$1;
    minutes=$2;
  ;;

  # Both minutes and hours are incorrect
  false )
    echo;

    # User input for hours
    while true;
    do
      read -p "Please enter the hour: " hours

      # The amount of hours is in the accepted range
      if (($hours >= 0 && $hours < 12))
      then
        break;
      fi
    done

    # User input for minutes
    while true;
    do
      read -p "Please enter the minutes: " minutes

      # The amount of minutes is in the acceptable range
      if (($minutes >= 0 && $minutes < 60))
      then
        break;
      fi
    done
  ;;
esac

# Calculates the degrees of each clock arm
degreeMinutes=$(($minutes * 6));
degreeHours=$(($hours * 30 + ($degreeMinutes / 72 * 6)));

# Calculates the abslute difference between the two clock arms
diff $degreeMinutes $degreeHours;
degrees=$?;

echo;
echo "The degree between the short arm and the long arm at $hours:$minutes is $degrees degrees.";

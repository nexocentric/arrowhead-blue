#!/bin/bash -u

#include debugging-tools.sh
#source debugging-tools.sh



# traptest.sh

trap "echo Booh!" SIGINT SIGTERM
echo "pid is $$"

while :     # This is the same as "while true".
do
        sleep 60  # This script is not really doing anything.
done

#script constants
#outputDebugInfo "setup all constants"
#PS1_OPTIONS=$(ls ps1)
# FUNCTION_OPTIONS=$(ls functions)
#ALIAS_OPTIONS=$(ls aliases)
#NANO_OPTIONS=$(ls nano)
#W5H_OPTIONS=$(ls w5h)

# for i in "${FUNCTION_OPTIONS[@]}"
# do
#   echo $i
# done


# #script variables
# outputDebugInfo "initialize all variables"
# optionCount=
# nextOption=
# userInput=

# #this function evaluates user yes no choices
# function evaluateBinaryChoice {
#   #$1 = the user's choice
#   select $1 in "YES" "NO" "Yes" "No" "yes" "no" "Y" "N" "y" "n"; do
#       case $1 in
#           [yY] | [yY][Ee][Ss] ) userInput=1; break;;
#           [nN] | [n|N][O|o] ) userInput=0; exit;;
#       esac
#   done
# }

# #this turns pairs of options into multiple
# #choice case switches
# function evaluateMultipleChoice {
# }

# #this fuction is used to get user input displays message too
# function getUserInput {
#   #$1 = a message to display to the user
#   read -p $1 userInput
# }

# function getUserInputBinary {
#   getUserInput $1
#   if [ -z userInput ]; then
#     echo "No options selected"
#     reutrn 1;
#   fi
#   evaluateBinaryChoice userInput
# }

# #cycle through all the lists and add options as the user sees fit
# outputDebugInfo "getting ready to go through all options"
# for optionList in $PS1_OPTIONS $FUNCTION_OPTIONS $ALIAS_OPTIONS $NANO_OPTIONS $W5H_OPTIONS
# do
#   outputDebugInfo "count all options in a a set list"
#   optionCount=${#optionList[@]}
#   for (( nextOption=0; nextOption<optionCount; nextOption++ ))
#   do
#     getUserInput "Include ${optionList[nextOption]} ?"
#     if [ userInput -eq 1 ]; then
#       echo ${optionList[nextOption]} >> .bash_profile
#       echo "Option added"
#     fi
#   done
# done

# echo "Terminus configured! Good luck programming!"

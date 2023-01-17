#!/bin/zsh
active=1
while [ "$active" -eq "1" ]; do
echo "
 @@@@@@@@  @@@@@@@    @@@@@@   @@@  @@@  @@@@@@@      @@@@@@@@  @@@@@@@@
@@@@@@@@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@@@@@@     @@@@@@@@  @@@@@@@@
!@@        @@!  @@@  @@!  @@@  @@!  @@@  @@!  @@@          @@!       @@!
!@!        !@!  @!@  !@!  @!@  !@!  @!@  !@!  @!@         !@!       !@!
!@! @!@!@  @!@!!@!   @!@  !@!  @!@  !@!  @!@@!@!         @!!       @!!
!!! !!@!!  !!@!@!    !@!  !!!  !@!  !!!  !!@!!!         !!!       !!!
:!!   !!:  !!: :!!   !!:  !!!  !!:  !!!  !!:           !!:       !!:
:!:   !::  :!:  !:!  :!:  !:!  :!:  !:!  :!:          :!:       :!:
 ::: ::::  ::   :::  ::::: ::  ::::: ::   ::           ::        ::
 :: :: :    :   : :   : :  :    : :  :    :           : :       : :"
echo "=============================="
echo "Created By Ian M & Sebastian V"
echo "=============================="
echo
echo "Please select an option

1. Triangular Numbers
2. Product of Non-Negatives
3. Quadratic Sequences
4. Exit"
echo
read userchoice
if [ "$userchoice" -eq "1" ] || [ "$userchoice" = "T" ] || [ "$userchoice" = "t" ] ; then
  echo "you picked task 1"
  echo
  echo "Enter a number: "
  read num
  # prompt user to enter a number, then reads the input ans stores it as $num
  echo
  for (( i = 1 ; i <= num ; i++ )) ; do
    triangular_number=$(( i * ( i + 1 ) / 2 ))
    if [ $triangular_number -le "$num" ] ; then # if the triangular number is less than or equal to the number entered by the user, then print the triangular numbers
      echo $triangular_number
      odd_count=$(( odd_count + 1 ))
    else
      even_count=$(( even_count + 1 ))
    fi
  done
  echo
  echo "There are $even_count even numbers and $odd_count odd numbers smaller than $num." # print the number of even and odd numbers
  echo
  echo "Done!"
  echo
  echo "Do you want to return to the menu? (Y/N)"
  read userchoice_2
  if [ "$userchoice_2" = "Y" ] || [ "$userchoice_2" = "y" ] ; then
    continue
  elif [ "$userchoice_2" = "N" ] || [ "$userchoice_2" = "n" ]; then
    echo "Good Bye!"
    break
  fi
elif [ "$userchoice" -eq "2" ] || [ "$userchoice" = "P" ] || [ "$userchoice" = "p" ] ; then
  echo "you picked task 2"
  echo
  echo "Enter how many numbers you want generated:
  ⇩"
  read num
  echo
  echo "Please, introduce a minimum value:
  ⇩"
  read minimum
  count=0
  i=$minimum
  while (( count <= num )); do
    if [ $(( i % 2 )) -ne 0 ]; then
      echo
      echo "--> $i"
      if [ $(( num % i )) -eq 0 ]; then
        echo "      ↳ is a factor of your number"
      else
        echo  "     ↳ is not a factor of your number"
      fi
      count=$(( count + 1 ))
    fi
    i=$(( i + 1 ))
    if [ $count -eq "$num" ]; then
        break
    fi
  done
  echo "Do you want to return to the menu? (Y/N)"
  read userchoice_2
  if [ "$userchoice_2" = "Y" ] || [ "$userchoice_2" = "y" ] ; then
    continue
  elif [ "$userchoice_2" = "N" ] || [ "$userchoice_2" = "n" ]; then
    echo "Good Bye!"
    break
  fi
elif [ "$userchoice" -eq "3" ] || [ "$userchoice" = "Q" ] || [ "$userchoice" = "q" ] ; then
  echo "you picked task 3"
  echo
  echo "Enter a value for A in an^2 + bn + c:
  ⇩"
  read a_val
  echo "Enter a value for B in an^2 + bn + c:
  ⇩"
  read b_val
  echo "Enter a value for C in an^2 + bn + c:
  ⇩"
  read c_val
  echo
  echo "What do you want to do now?
  1. Find a limited number of terms
  2. Find a term in a specific position"
  echo
  read subchoice
  if [ "$subchoice" -eq 1 ] ; then
    sumcount=0
    echo "Please, specify how many terms of the sequence you want to print:
    ⇩"
    read usernum
    echo
    echo "  The first $usernum terms of the sequence:
  ========================================================
  --> $a_val*n^2 + $b_val*n + $c_val ... are ...
  ========================================================"
    echo
    for (( i = 1; i <= usernum ; i++ )); do
      n_val=$i
      n_squared=$(( n_val * n_val ))
      eq_term1=$(( a_val * n_squared ))
      eq_term2=$(( b_val * n_val ))
      term=$(( eq_term1 + eq_term2 + c_val ))
      echo
      echo "--> $term"
      echo
      sumcount=$(( sumcount + term ))
    done
    echo
    echo "The sum of these terms is --> $sumcount"
    echo
  elif [ "$subchoice" -eq 2 ] ; then
    echo
    echo "Please, specify which term of the sequence you want to print:
    ⇩"
    read n_val
    n_squared=$((n_val * n_val))
    eq_term1=$((a_val * n_squared))
    eq_term2=$((b_val * n_val))
    term=$(( eq_term1 + eq_term2 + c_val))
    echo "
  ========================================================
    The $n_val'th term in $a_val*n^2 + $b_val*n + $c_val = $term
  ========================================================
    "
    echo
    echo "Please, enter a number to check if the result is a multiple of it:
    ⇩"
    read is_factor
    if [ $((term%is_factor)) -eq 0 ]; then
        echo
        echo "✓ $term is a multiple of $is_factor ✓"
    else
        echo
        echo "✗ $term is not a multiple of $is_factor ✗"
    fi
  else
    echo
    echo "Please, try again with a valid option from the menu above"
  fi
  echo "Do you want to return to the menu? (Y/N)"
  read userchoice_2
  if [ "$userchoice_2" = "Y" ] || [ "$userchoice_2" = "y" ] ; then
    continue
  elif [ "$userchoice_2" = "N" ] || [ "$userchoice_2" = "n" ]; then
    echo "Good Bye!"
    break
  fi
elif [ "$userchoice" -eq "4" ] || [ "$userchoice" == "E" ] || [ "$userchoice" == "e" ] ; then
  echo
  echo "Good bye!"
  echo
  exit
else
  echo
  echo "...Error! Please, return and enter a valid value..."
  echo
fi
done